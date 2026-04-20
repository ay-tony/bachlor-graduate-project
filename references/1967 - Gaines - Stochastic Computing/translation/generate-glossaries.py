import json
import os


def tex_escape(text):
    """
    处理 LaTeX 特殊字符
    """
    import re

    # 这里的顺序很重要
    regex = re.compile(r"([&%#_{}])")
    return regex.sub(r"\\\1", text)


def convert():
    json_file = "../glossary.json"  # 你的源文件名
    bib_file = "glossary.bib"

    if not os.path.exists(json_file):
        print(f"Error: {json_file} not found.")
        return

    with open(json_file, "r", encoding="utf-8") as f:
        data = json.load(f)

    with open(bib_file, "w", encoding="utf-8") as f:
        i = 0
        for english, chinese in data.items():
            i += 1

            english = tex_escape(english)
            chinese = tex_escape(chinese)

            f.write(f"@entry{{{i},\n")
            f.write(f"  name={{{english}}},\n")
            f.write(f"  description={{{chinese}}}\n")
            f.write(f"}}\n\n")
    print(f"Successfully converted {len(data)} terms to {bib_file}")


if __name__ == "__main__":
    convert()
