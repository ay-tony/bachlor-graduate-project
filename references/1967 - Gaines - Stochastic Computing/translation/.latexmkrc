# .latexmkrc 配置文件
# 功能：自动运行 Python 转换脚本，并集成 bib2gls (针对 glossaries-extra)

# 1. 引擎设置
$pdf_mode = 5; # 强制使用 xelatex

# 2. 编译启动前强制运行 Python 脚本
# 这样保证每次启动 latexmk，哪怕没有改动，术语库也是最新的
print "--- [Pre-processing] Running JSON to BIB conversion ---\n";
if ($^O eq 'MSWin32') {
    system("python generate-glossaries.py");
} else {
    system("python3 generate-glossaries.py");
}

# 3. 注册生成文件扩展名
# %R 是主文件名，glstex 是 bib2gls 生成的中间文件
push @generated_exts, 'glg', '%R*.glstex', 'glsdefs';

# 4. 定义自定义依赖规则
# 当 .aux 文件变动时，触发 run_bib2gls 子程序
add_cus_dep( 'aux', 'glstex', 0, 'run_bib2gls' );

# 5. 定义 bib2gls 运行子程序（参考标准示例优化）
sub run_bib2gls {
    my $ret = 0;
    # 自动解析路径和主文件名
    my ($base, $path) = fileparse( $_[0] );
    
    # 构造 bib2gls 命令行指令
    # 使用 --tex-encoding UTF-8 解决中文和特殊字符编码问题
    # 使用 --group 开启字母分组支持
    my @bib2gls_cmd = (
        "bib2gls",
        "--tex-encoding", "UTF-8",
        "--log-encoding", "UTF-8",
        "--group",
        "--dir", $path,
        $base
    );
    
    if ($silent) { unshift @bib2gls_cmd, "--silent"; }
    
    print "Running '@bib2gls_cmd'...\n";
    $ret = system @bib2gls_cmd;
    
    if ($ret) {
        warn "Run_bib2gls: Error, bib2gls failed.\n";
        return $ret;
    }

    # 深度分析 bib2gls 的日志文件 (.glg)
    # 这步非常关键：它告诉 latexmk 哪些 .bib 文件被读取了，
    # 哪些 .glstex 被输出了，从而实现精准的增量编译。
    my $glg = "$_[0].glg";
    if ( open( my $glg_fh, '<', $glg) ) {
        rdb_add_generated( $glg ); 
        while (<$glg_fh>) {
            s/\s*$//;
            # 如果日志显示读取了某文件，将其加入监控列表
            if (/^Reading\s+(.+)$/) { rdb_ensure_file( $rule, $1 ); }
            # 如果日志显示输出了某文件，标记为生成文件
            if (/^Writing\s+(.+)$/) { rdb_add_generated( $1 ); }
        }
        close $glg_fh;
    }
    else {
        warn "Run_bib2gls: Cannot read log file '$glg': $!\n";
    }
    return $ret;
}

# 6. 强制更新设置
# 确保如果生成的 .bib 文件发生变化，latexmk 会重新启动整个流程
$reprocess_if_changed{'.bib'} = 1;

