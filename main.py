from latex_to_zh import convert

if __name__ == '__main__':
    text = r'±1'
    text = r'- \pi '

    print(convert(text))