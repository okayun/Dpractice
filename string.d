import std.stdio;
import std.algorithm;
import std.array;
import std.bigint;
import std.conv;
import std.math;
import std.range;
import std.string;
import std.typecons;

void main() {
  /**********   宣言   **********/

  char c = 'a';
  // 配列は, type[n] と, n を指定すると静的配列(固定長)になる.
  // type[] とすると動的配列になる

  // 代入する文字列の長さと char[n] の n の値が一致していないと Error
  // n を指定しないと "char[]" がなぜか string として扱われる...
  char[6] s = "char[]";
  // char[6] s = "char[]".map!(to!char).array; こうすることで "char[]" の各要素を immutable char -> char にできるけど...
  // char[6] s = ['c', 'h', 'a', 'r', '[', ']']; もできるけど...

  // immutable(char)[] と定義されている
  // つまり, 破壊的代入ができない
  string t = "immutable(char)[]"; // これは OK



  /**********   代入   **********/

  c = 'b';
  t = "new immutable(char)[]";
  // s[] = "new char[]"; これは s の長さと "new char[]" の長さが一致していないので Error

  // これは動的配列
  char[] u;
  // char[] u = "new char[]"; // これは Error

  // 代入だが, u = "new char[]"; も u[] = "new char[]"; も Error
  // リサイズしてやる必要があるので, 以下のようにする
  u.length = "new char[]".length;
  u[] = "new char[]";

  writeln(c, " ", s, " ", t);



  /**********   連結   **********/

  // 文字列の連結は, + ではなく ~ と定義されている
  u = u ~ " connect"; // u ~= " connect"; でも同様

  // s ~= u; これは s が静的配列なので Error
  // u ~= s; これは 連結して代入する配列が動的配列なので OK
  /***********************************************

    連結は, char[] だけでなくどんな型の配列でも可能
            ( $ も スライス も可能)

  ***********************************************/

  writeln(u);



  /***********   $   **********/

  // 配列の添字の中だけ使用できる $ は, その配列の長さを表す
  writeln(u[$ - 1]); // u の最後の要素 't' を指す



  /**********   スライス   **********/

  // 文字列 u の, s[1] ~ s[4] まで(半開区間)
  writeln(u[1..5]);


  /**********************************
          配列のプロパティ関数は,
            init
            sizeof
            length
            ptr
            dup
            idup
            reverse
            sort
          のみ.
  他にも使い方はあるけど, 詳しくはHP参照
  **********************************/
}
