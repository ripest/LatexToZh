from latex_to_zh import convert


def test_four_basic():
    assert convert('1+2-3*5/6') == '1加2减3乘5除以6'
    assert convert('1+4=5') == '1加4等于5'
    assert convert(r'60 \div 7 = 8 \cdots 4') == '60除以7等于8余4'

def test_text():
    text = r"\text{平行四边形面积} = \text{底} \times \text{高} = 8 \, \text{厘米} \times 8 \, \text{厘米} = 64 \, \text{平方厘米} "
    result = convert(text)
    assert result == '平行四边形面积等于底乘高等于8乘厘米乘8乘厘米等于64乘平方厘米'


def test_triangle():
    text = r'\triangle ABD'
    result = convert(text)
    assert result == '三角形ABD'


def test_times():
    text = r'1 \times 2'
    result = convert(text)
    assert result == '1乘2'


def test_frac():
    text = r'\frac{1}{2}'
    result = convert(text)
    assert result == '2分之1'


def test_supexpr():
    assert convert('y^n') == 'y的n次方'
    assert convert('y^2') == 'y的平方'
    assert convert('y^3') == 'y的立方'


def test_cases():
    text = r'\begin{cases} x + y = 5 \\ x - y = 3 \\ x - y = 3 \end{cases}'
    result = convert(text)
    assert result == '第1方程：x加y等于5;第2方程：x减y等于3;第3方程：x减y等于3;'


def test_pi():
    assert convert(r'-\pi') == '负π'


def test_lt_gt():
    assert convert(r'\frac{3}{4} > 0') == '4分之3大于0'
    assert convert(r'\frac{3}{4} < 0') == '4分之3小于0'
    assert convert(r'\frac{3}{4} <= 0') == '4分之3小于等于0'


