# 引数を受け取る
$brush = $Args[0]
if ( [string]::IsNullOrEmpty( $brush ) ) {
    "Error"
    return
}

# クリップボードから値の取得
Add-Type -Assembly System.Windows.Forms
$val = [Windows.Forms.Clipboard]::GetText()

# SyntaxHighlighter用に文字列を加工
$val = $val -creplace "<", "&lt;"
$val = $val -creplace ">", "&gt;"
$val = "<pre class=`"brush:" + $brush + ";`">" + $val + "</pre>"

# クリップボードに値をセット
$OutputEncoding = [Text.Encoding]::Default
$val | Clip