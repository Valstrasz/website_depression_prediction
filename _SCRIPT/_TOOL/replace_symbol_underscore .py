from argparse import (
    ArgumentParser,
    Namespace)
import re as re



argparser: ArgumentParser = ArgumentParser()
argparser.add_argument("--string_to_format",
                       required = True,
                       type = str,
                       help = "String to format by replacing 'symbols' (everything which is neither a letter nor a digit) with underscores")
argparser.add_argument("--prefix_to_append",
                       required = False,
                       default = "",
                       type = str,
                       help = "An optional prefix to be appended to the formatted string")
args: Namespace = argparser.parse_args()
characters: str = args.prefix_to_append + args.string_to_format



def format_string(string_to_format: str,
                  regex_validation: str = r"[^\w\d]") -> str:
    string_formatted: str = re.sub(pattern = regex_validation,
                                   repl = r"_",
                                   string = string_to_format)
    return string_formatted


if (__name__ == "__main__"):
    print(format_string(string_to_format = characters))