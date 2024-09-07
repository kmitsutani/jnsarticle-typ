#import "jnsarticle.typ": main, appendix, thebibliography
#import "@preview/physica:0.9.3": *
#show: main.with(
  title: [伝搬関数と$T$-積], authors: [三ツ谷和也], abstract: [
  散乱過程では一般に複数の粒子が複雑に相互作用しながら伝播していくことが予想される．
  しかし近接相互作用のみを仮定するならば相互作用と相互作用の間で
  自由な粒子の伝播を考えることができる．
  したがって自由粒子の伝播振幅について考察しておくことは散乱を考えるうえで基礎となるだろう．
  本節では自由粒子の伝搬振幅について考察する．
  また時間に依存する複数の演算子の積を考えるときに便利になる$T$-積
  という記法についても紹介する．
  ],
)


#let evobw(t) = $e^(i hat(H)_0 #t)$
#let evofw(t) = $e^(-i hat(H)_0 #t)$
#let covmes(k) = $d tilde(bold(k))$
#let fprop = $Delta_"F"$
#let fpropf = $tilde{Delta}_"F"$
#let Ek = $E_(bold(k))$
#let cuhc = $C^((+))$
#let clhc = $C^((-))$

= 自由Klein-Gordon場の伝搬振幅

時刻 $x^0$ に空間座標 $bold(x)$ 自由Klein-Gordon場（以下KG場）が生成し，
しかる後時刻 $y^0$ に空間座標 $bold(y)$ で消滅する（すなわち$y^0 > x^0$ を仮定する）という現象
の確率振幅を考えたい．
そのために今まで用いてきた運動量固有状態の生成消滅演算子のフーリエ変換
$
    hat(a)_(bold(x)) &= sum_(bold(p)) hat(a)_(bold(p)) e^(+i bold(p)bold(x)) 
    hat(a)^dagger_(bold(x)) &= sum_(bold(p)) hat(a)^dagger_(bold(p)) e^(-i bold(p)bold(x)) 
$
を考える．ただしここで$bold(x)$および$bold(p)$は離散的な値をとるとした．
これらは
$
hat(x) a^dagger_(bold(x))ket(0) 
    &= bold(x) ket(bold(x))
hat(a)_(bold(x^prime))hat(a)^dagger_(bold(x))ket(0) 
    &= delta_(bold(x)^prime, bold(x)) ket(0)
$
のように位置の固有状態に対する生成消滅演算子として機能する
footnote(
位置の固有状態になることの計算は簡単だが一息に暗算するには少し長いかもしれないので
導出を一応以下に記しておく．  
$
hat(x) a^dagger_(bold(x))ket(0) 
    = hat(x) sum_(bold(y), bold(p))
        ketbra(bold(y))a^dagger_(bold(p))e^(-i bold(p)bold(x)) ket(0) 
    = sum_(bold(y),bold(p)) y ket(y) braket(bold(y))(bold(p)) e^(-i bold(p)bold(x))
    = sum_(bold(y),bold(p)) y ket(y) e^(+i bold(p)(y)) e^(-i bold(p)bold(x))
    
$
最後の式で$bold(p)$に関する和をとれば$delta_(bold(x), bold(y))$
が出てくるのであとは自明である．
)．

これらの生成消滅演算子を用いれば上記の事象の確率振幅は
$
    c(x^0;bold(x) arrow.r y^0;bold(y)) 
    & prop
    mel(
        evobw(y^0) hat(a)_(bold(y))
        evofw((y^0 - x^0)) hat(a)^dagger_(bold(x)) evofw(x^0)
    , 0, 0)
$ 
となる．
振幅を右から順に読んでいけば基準時刻$t=0$に真空を用意してそれを時刻$x^0$まで時間発展させ
その時刻で固有値$bold(x)$の位置の固有状態を生成し，
さらに時刻$y^0$まで状態を発展させたのちに固有値$bold(y)$の位置の固有状態を消滅させ，
時刻$y^0$まで時間発展させた真空$exp(-i hat(H)_0 y^0)ket(0)$に
共役なブラベクトル$bra(0)exp(+i hat(H)_0 y^0)$を作用させて振幅を計算するということをしている．

subsection(ファインマンプロパゲーター)
上式において時刻$x^0$から$y^0$までの時間発展の部分を分離して書き位置の固有状態の生成消滅演算子を
運動量の生成消滅演算子の和で書き直すと
$
    c(x^0;bold(x) arrow.r y^0;bold(y)) 
    ∝
     mel(
        evobw(y^0) 
        (sum_(bold(q)) hat(a)_(bold(q)) e^(+i bold(q)bold(y)))
        evofw(y^0) 
        evobw(x^0)
        (sum_(bold(p)) hat(a)^dagger_(bold(p)) e^(-i bold(p)bold(x)))
        evofw(x^0)
    , 0, 0)

$


以下に再掲する式(I$.86$)および式(I$.87$)
$
&(text(I.)86)
e^(i hat(H)_0 (t-t_0))a_(bold(k))e^(-i hat(H)_0 (t-t_0))
= a(bold(k))e^(-i k _0 (t-t_0))  
&(text(I.)87)
e^(i hat(H)_0 (t-t_0))a^dagger_(bold(k))e^(-i hat(H)_0(t-t_0))
= a^dagger(bold(k))e^(+i k _0(t-t_0)) 
$
を意識して少し計算すると
footnote(
式(I.86-87)より
$
    e^(+i hat(H)_0y^0)hat(a)_(bold(q))e^(-i hat(H)_0 y^0)e^(+i bold(q)bold(y))
    =hat(a)e^(-i q y )
$
および
$
    e^(-i hat(H)_0x^0)hat(a)_(bold(p))^dagger e^(+i hat(H)_0x^0)
    e^(+i bold(p)bold(x)) =hat(a)^dagger e^(-i p x)
$
となることを踏まえ，
$
    phi(x)=integral covmes(k) (hat(a)_(bold(k))e^(-i k x) 
                            + hat(a)^dagger_(bold(k))e^(+i k x))
$
であったことを思い出し最後に連続極限をとるときに
離散的な場合の交換関係$[a_(bold(q)), a^dagger_(bold(p))] = delta_(bold(q), bold(p))$
と連続的な場合の交換関係
$[a_(bold(q)), a^dagger_(bold(p))] = (2pi)^3 2E_(bold(p))delta(bold(q) - bold(p))$
の違いを吸収する規格化因子
$
    [(2pi)^3 E_(bold(p))]^(-1) [(2pi)^3 E_(bold(q))]^(-1)
$
が出てくることを考慮する．
)
上式で運動量を連続にした極限は
$
    mel(phi(y)phi(x), 0, 0)
$
と等しくなることがわかる
（ただし振幅として等しいというだけでブラケットに挟まれている演算子が等しいというわけではない）．

上では $y^0 > x^0$ を仮定したがより一般には上の形の積からは $x^0 > y^0$ の場合の
粒子の伝播の情報も取り出せる．
ただしその時は $ket(0)$ に先に $phi(y)$ を作用させなくてはならないので
$
    mel(phi(x)phi(y), 0, 0)
$
が対応する振幅である．

したがってKG場二つを使用して記述できる粒子の伝播の情報は
$
    fprop(x, y) = i  [ theta(x^0 > y^0) mel(phi(x)phi(y), 0, 0)
    + theta(y^0 > x^0) mel(phi(y)phi(x), 0, 0)  ]
    
$
に含まれる．ここで慣習に合わせて全体に虚数単位$i$をかけた．
式（ref(FeynmanPropagator)）であらわされる量を
ファインマンプロパゲーター（Feynman propagator）
または日本語でファインマン伝播関数という．
また「ファインマン」を省略してプロパゲーターや伝播関数とも呼ぶ．
後述するように数学的には伝播関数は運動方程式を生成する微分演算子
（今の場合KG演算子$D^"KG"=(□ + m^2)$）のグリーン関数としての性質も持つため
単にグリーン関数と呼ばれることもある
（のちにみるように上で虚数単位を付与したことによって
$fprop$がグリーン関数に厳密に一致する）．

系が一様な場合は伝播関数は$x$と$y$の相対的な位置関係のみに依存する．
これを見るために上のファインマン伝播関数をより明示的な表式に書き換える．
$
    mel(phi(x)phi(y), 0, 0)
    &= mel(
        integral covmes(p) covmes(q)
        a_(bold(p)) e^(-i p x)
        a^dagger_(bold(q)) e^(+i q x)
        , 0, 0) 
    &= mel(
        integral covmes(p) covmes(q)
        [a^dagger_(bold(q))a_(bold(p)) 
        + (2pi)^3 E_(bold(p))delta^3(bold(q)-bold(p))]
        e^(-i p x+i q y )
    , 0, 0) 
    &= mel(
        integral covmes(p) e^(-i p(x-y))
    , 0, 0)
$
$mel(phi(y)phi(x), 0, 0)$はこれのエルミート共役なので結局
$
fprop(x,y) 
= integral covmes(p) 
 [
    theta(x^0-y^0) e^(-i p(x-y)) + theta(y^0-x^0) e^(+i p(x-y))
 ]

$
となり$fprop(x,y)$は$x$と$y$の相対的な位置$x-y$のみに依存することがわかる．
そのため以下では$fprop$を一変数関数とみなし
$fprop(x-y)$や$fprop(x)$のように書く．


subsection(ファンマンプロパゲーターがグリーン関数であることの確認)
上でも述べたように伝播関数は場の従う運動方程式（今の場合Klein-Gordon演算子）の
グリーン関数にもなっている．すなわち
$
    (□ + m^2)fprop(x) = delta^4(x)
$
である．これは重要な性質なので以下で確認する．
まず一階微分を計算する．
$
    partial_mu fprop(x) 
    &= partial_mu
        i mel(theta(x_0)phi(x)phi(0) + theta(-x_0)phi(0)phi(x), 0, 0)
    &= i mel(
        partial_mu  [
         (
            phi(x)phi(0)theta(x_0) + phi(y)phi(x)theta(-x_0) 
         )  ]
    , 0, 0)
    &= i mel(
        partial_mu phi(x) phi(0) theta(x_0)
        + phi(x)phi(0) partial_mu (x_0)
    , 0, 0)
    &" " + i mel(
        phi(0) partial_mu phi(x)  theta(-x_0)
        + phi(x)phi(0) partial_mu (-x_0)
    , 0, 0)
$
ここで
$partial_mu theta(x_0) = delta_(mu,0) delta(x_0),
partial_mu theta(-x_0) = -delta_(mu,0) delta(x_0)$
に注意すると上の微分は
$
    partial_mu fprop(x) 
    &=i mel(
        partial_mu phi(x) phi(0) theta(x_0)
        +phi(0) partial_mu phi(x)  theta(-x_0)
    , 0, 0)  
    &" " + i mel(
        phi(x)phi(0) delta(x_0)
        - phi(x)phi(0) delta(x_0)delta_(mu,0)
    , 0, 0) 
$
ここで第二項は$delta(x_0)$の存在により場の演算子の同時刻交換関係となり落ちる．
次にもう一回微分してダランベルシアンの作用を計算すると
$
   partial^mu partial_mu fprop(x) 
   &= i mel(
    [□ phi(x)] phi(0) theta(x_0) + phi(0) [□ phi(x)] theta(-x_0)
   , 0, 0)
   &" " + i mel(
        (dot(phi)(x) phi(0)
        -phi(0) dot(phi)(x))  delta(x_0)
   , 0, 0)
$
第二項に同時刻交換関係$[phi(x),dot(phi)(y)]=i delta(bold(x)-bold(y))$を課せば
質量項の寄与も含めて最終的に次のようになる．
$
    (□ + m^2)fprop(x) 
    &= i mel(
         [
            (□ + m^2) phi(x) 
         ] phi(0) theta(x_0)
    +
        phi(0)  [
            (□ + m^2) phi(x) 
         ]  theta(x_0)
    , 0, 0)
    &"  " + i mel(
        (dot(phi)(x) phi(0)
        -phi(0) dot(phi)(x))  delta(x_0)
   , 0, 0)
    &= i times (-i delta^3(bold(x))) delta(x_0) = delta^4(x)
$
したがって$fprop$がKlein-Gordon方程式のグリーン関数であることが分かった．
また上の計算から明らかなようにファインマン伝播関数を定義するときに乗じた
虚数単位のおかげでファンマン伝播関数がグリーン関数に係数も混みで一致することがわかる．

subsection(ファインマンプロパゲーターのフーリエ変換)
一番初めに相互作用と相互作用の間に自由伝播を考えることができると述べた．
一般に相互作用があると粒子のエネルギー運動量は変化し，
また別の量子数での自由伝播を行うことになる．
しかし一粒子のエネルギー運動量が変化するからと言って
エネルギー運動量保存則が破れるわけではなく，
相互作用にかかわった粒子全体でエネルギー運動量が保存するように
相互作用のプロセスは行われる．
相互作用を考える際には
伝播関数のうちそのようなエネルギー運動量保存が成立する
ような制約条件を付けて振幅を計算する．
その目的のためには時空間内の伝搬と直感的につながる利点を捨ててでも
運動量表示で扱うほうが簡単である．
一方でファインマンプロパゲーターのフーリエ変換は
階段関数のフーリエ変換が自明でないためfootnote(
$d/(d t) theta(plus.minus t) = delta(t)$および
$delta(t) = integral (d omega)/(2pi) e^(-i omega t)$
を利用して最終的に複素積分を用いて階段関数のフーリエ変換を与えるという方法はある
(例えば坂本cite(SakamotoQFT1)の11.4を見よ)．
そちらのほうが計算の行数は少なくなるかもしれないが
運動量表示の伝播関数の極の位置について考えることは物理的に意義があると思うので
テキスト同様の手法で計算する．
)難しい．

そこで先ほど確認したKlein-Gordon方程式のグリーン関数との等価性を利用する．

Klein-Gordon方程式をフーリエ変換し運動量表示にすると
$fprop(x)$のフーリエ変換$fpropf(k)$は以下の方程式を満たす
$
    (-k^2 + m^2) fpropf (k) = 1
$
となる．
これは簡単に解けて
$
fpropf(k)  &= (-1)/(k^2 - m^2)  
            &= (-1)/(k_0^2 - E_(bold(k))^2)
$
となる．ここで$E_(bold(k)) = sqrt(m^2 + bold(k)^2)$は
on-shellの場合に三次元運動量$p$の粒子が持つエネルギーである．
この$fpropf(k)$の逆フーリエ変換（以下でフーリエ変換を与える演算子を$hat(F)$と置く）
$
    (hat(F)^(-1) fpropf)(x)
    = integral (d^4 k)/((2pi)^4) e^(-i k x) (-1)/(k_0^2 - Ek^2)
    = integral d^3bold(k) e^(i bold(k)bold(x)) integral d k_0 (-e^(-i k _0t))/(k_0^2 - Ek^2) 
$
が$fprop(x)$に一致するならば整合的なのであるが
表式から明らかなように$fpropf(k)$は実軸上で発散している．
実解析の範囲で積分が収束するかは定かでないので以下の処方をとる．
begin(enumerate)
    item $k_0$-積分の被積分関数を$k_0 in bb(R)$
        から$z in bb(C)$
        に解析接続する．
        
    item $E_(bold(k)) arrow.r E_(bold(k)) + i gamma$ の置き換えを行う．
         
    item 実軸を含む複素平面上の閉経路で$z$-積分を行うことにより実軸上の積分値を求める
        
    item 得られた値の$gamma arrow.r 0$の極限をとる．
        
end(enumerate)
結局のところ収束が確認できない積分を積分と極限のおおらかな交換によって計算するということである．
そのため数学的には正当性が薄いのであるが上の手続きには物理的な解釈を与えることができる．
エネルギー固有値に$E_(bold(k))+i gamma$のように虚部を持たせることは
不安定粒子や外部への散逸が存在する系にを記述するために行われることがある
footnote(
歴史上はおそらく原子核の$alpha$崩壊を記述するためにGamovが用いた処方が初である．
エネルギー固有値が虚部を持つことはハミルトニアンのエルミート性に反するように思われる．
しかし状態空間のほうに二乗可積でないようなものが含まれているときには
ハミルトニアンがエルミートでもエネルギー固有値は虚部を持ちうるらしいcite(Hatano2017)．
二乗可積ではない状態というものは珍しいものではなく
自由粒子の位置の固有状態や運動量固有状態がそうである．
そのオブザーバブル表示をとれる連続スペクトルを持つオブザーバブルの固有状態はすべてそうである．
)．
特に不安定粒子を例にとると時間発展が
$exp(-i(E_(bold(k))+i gamma)t)=exp(-i E_(bold(k))t)times exp(-gamma t)$
となるためおおむね$abs(gamma)^(-1)$の時間で指数関数的に状態の振幅が消失
（$gamma < 0$なら発散）してしまう．
一方で$abs(gamma) << E_(bold(k))$の極限では崩壊までの間に十分な数の平面波が含まれており
近似的に安定粒子として扱える．
つまり上の処理においては$abs(gamma) << E_(bold(k))$
が成立する程度の準安定な粒子と完全な安定粒子の
物理的性質が連続的につながっていると信じて極限と積分を交換しているといえる．

上の方針で計算を進めていくにあたり複素積分に移行することを意識して
$fpropf(k)$の逆フーリエ変換を
$
(hat(F)^(-1)fpropf)(x)
&= i integral covmes(k) (2Ek) e^(+i bold(k)bold(x))
     (1)/(2pi i) integral d k_0 (-e^(-i k _0 t))/(k_0^2 - Ek^2) 
&= i integral covmes(k) (2Ek) e^(+i bold(k)bold(x)) 
      (1)/(2pi i) integral d k_0 f(k_0; Ek, t)
$
の形に分解しておく．
ここで$f(k_0; omega, t) = (-e^(-i k _0t))/(k_0^2 - omega^2)$と置いた．
上の処方を施すにあたり$e^(-i k _0t)$を解析接続した$e^(-i z t)$の肩の符号について考える．
$-i (Re z + i Im z)t = -i(Re z )t + (Im z) t$なので
$t > 0$の時は$Im z < 0$すなわち下半面の無限遠で $e^(-i z t)$の項は
指数関数的に$0$に落ちる．
逆に$-t$の時は上半面の無限遠で指数項は指数関数的に$0$に落ちる．
複素平面の上半面にある半円の半径無限大の極限をとった反時計周りの閉経路$cuhc$および
下半面での時計回り閉経路を$clhc$と書くことにする．
そうすると先ほどの$e^(-i z t)$に関する考察から

$
    integral.cont_(clhc) d z (dots)
    &= lim_(R arrow.r +infinity)  [
    integral_(-R)^(+R)d z(dots) 
    + integral_("下半円") d z (dots)
     ] 
    = integral_(-infinity)^(infinity) d k_0 (dots)" "(t>0)
    integral.cont_(cuhc) d z (dots) 
    &= lim_(R arrow.r +infinity)  [
    integral_(-R)^(+R)d z (dots) 
    + integral_("上半円") d z (dots)
     ]
    = integral_(-infinity)^(infinity) d k_0 (dots)" "(t<0)
$

が成立する．
したがって$f(k_0; omega, t)$を解析接続し，
$k_0 in bb(R) arrow.r z in bb(C)$の
置き換えを行うと
$
    (1)/(2pi i) integral d z
    (-e^(-i z t))/((z-omega_(+))(z-omega_(-)))
    &= theta(t)
          [
            (1)/(2 pi i) integral.cont_(clhc) d z
            (-e^(-i z t))/((z-omega_(+))(z-omega_(-)))
         ]   
    &" "+ theta(-t) 
         [
            (1)/(2 pi i) integral.cont_(cuhc) d z
            (-e^(-i z t))/((z-omega_(+))(z-omega_(-)))
         ] 
    
$
となるfootnote(
    実は極のずらし方には本文で採用したもの以外にもバリエーションがある．
    それは「実部の正負に関係なく両方上（下）半面にずらす」というものである．
    しかし式(ref(decomposition_of_timeintegral))
    を見ればわかるようにそのようなケースでは$theta(t)$あるいは
    $theta(-t)$のどちらかが落ちる．
    $t$の大小だけで遷移が禁止されるような条件は特になくこれは物理的に
    不自然な状況である．
    したがってこのようなケースは今考えているケースにはふさわしくない．
)．
上式で$omega_plus.minus=plus.minus(Ek+i gamma)$と置いた．
以下では留数定理を用いて積分を評価していくので$omega_plus.minus$における
留数を計算しておく．
すると$z=omega_plus.minus$における留数$R_+, R_-$はそれぞれ
$
R_+ &= "Res" (omega_+; f) 
    = (- e^(-i (Ek+i gamma) t))/(omega_+ - omega_-) 
    = (- e^(-i Ek t +gamma t))/(2(Ek + i gamma)) 
R_- &= "Res" (omega_-; f)  
    = (- e^(-i (-Ek -i gamma) t))/(omega_- - omega_+)
    = ( e^(+i Ek t -gamma t))/(2(Ek + i gamma))
$
となる．

$gamma>0$の時$clhc$積分は$z=omega_-$の留数を
$cuhc$積分は$z=omega_+$の留数を拾う．
一方$gamma <0$の時は$clhc$積分は$z=omega_+$の留数を拾い
$cuhc$積分は$k^0=omega_-$の留数を拾う．
footnote(
    $clhc$は時計回りに回しているので留数に$-1$をかけたものが出てくる．
)
$
    (z"-積分")
    &=  theta(t) (-R_-) + theta(-t) R_+
        = theta(t) (-e^(+i Ek t -gamma t))/(2(Ek + i gamma))
        + theta(-t) (- e^(-i Ek t +gamma t))/(2(Ek + i gamma))
        " " (gamma > 0) 
    &= theta(t) (-R_+)  + theta(-t)R_-
        = theta(t) (e^(-i Ek t +gamma t))/(2(Ek + i gamma))
        + theta(-t) ( e^(+i Ek t +gamma t))/(2(Ek + i gamma))
        " " (gamma < 0)       
    
$

となる．ここで$gamma$に依存する因子を見ると
$z$-積分は$gamma$が正の場合と負の場合それぞれで以下のような構造をしている．
$
    (dots) theta(t) e^(-abs(gamma) t) 
    + (dots) theta(-t)e^(+abs(gamma) t) &"  " (gamma > 0) 
    (dots) theta(t) e^(-abs(gamma) t) 
    + (dots) theta(-t)e^(+abs(gamma) t) &"  " (gamma < 0)
$

$theta(t)$を持つ項は$t arrow.r + infinity$の極限を考えうる．
同様に$theta(-t)$を持つ項は$t arrow.r - infinity$の極限を考えうる．
上式を見ると$gamma$の符号がどちらの場合でも
無限の未来と無限の将来で伝搬振幅が指数関数的に落ち物理的直観と整合的である．
したがって無限の未来および過去での漸近的挙動を根拠に$gamma$の符号を決めることはできない．

ここで$gamma$の符号を$sigma$とすると
式(ref(gamma_pos))および式(ref(gamma_neg))は
$
integral d z (-e^(-i z t))/((z - omega_+)(z - omega_-))
    = - sigma
     [
    theta(t) (e^(+i sigma (Ek t +i gamma) t))/(2(Ek + i gamma))
    + theta(-t) (e^(-i sigma (Ek +i gamma) t))/(2(Ek + i gamma))
     ]
$
となる．したがって$fpropf(k)$の逆フーリエ変換は
$
    lim_(gamma arrow.r 0^(sigma)) hat(F)^(-1)(fpropf (; gamma))(x)
    =
    -i sigma integral covmes(k) 2Ek e^(i bold(k)bold(x))
     (
    theta(t) (e^(+i sigma Ek t))/(2Ek)
    +theta(-t) (e^(-i sigma Ek t))/(2Ek)
     )
    
$
となる．ここで$e^(i bold(k)bold(x))e^(i Ek t)$の項に関しては
$bold(k)arrow.r-bold(k)$の変数変換を行うと
積分範囲を
$(+infinity, -infinity)arrow.r (-infinity, +infinity)$に反転する操作から
$(-1)^3$の因子が，積分要素から$(-1)^3$の因子が出てくるので結局
被積分関数に$bold(k)arrow.r-bold(k)$を施しただけの結果と同じになるので
$
integral covmes(k) e^(i bold(k)bold(x)) e^(i Ek t)
= integral covmes(k) e^(-i bold(k)bold(x))e^(i E_(-bold(k)) t)
= integral covmes(k)  e^(i k x)
$
とできる．つまり指数の肩に関しては$k_0=Ek$の符号だけ見ればよい．
その結果
$
    fprop^sigma (x) = -i sigma integral d^3 tilde(bold(k))
     (
        theta(t)e^(i sigma k x)
        + theta(t)e^(-i sigma k x)
     )
    
$
が求まる．
グリーン関数との等価性を利用してフーリエ変換の逆変換として出てきた
この$fprop^sigma (x)$は最初のほうで時空の一様性からの帰結を
確認するためにあらわに書き下した$fprop$の表式
(ref(exp_expansion_fprop))
$
fprop(x,y) 
= i integral covmes(p) 
 [
    theta(x^0-y^0) e^(-i p(x-y)) + theta(y^0-x^0) e^(+i p(x-y))
 ]

$
と比較すると$sigma=-1$の時に元のファインマンプロパゲーターと
一致することがわかる．
footnote(
それでは元の式と突き合わせるまで棄却する理由が生まれなかった
$sigma=+1$の時の解は何だったのであろうか．
単にフーリエ変換しただけのものを逆フーリエ変換しているだけであったら
このような分岐は生まれなかったように思う．
)．

これらの結果をまとめるとファインマンプロパゲーターのフーリエ変換は
微小パラメータ$epsilon >0$を用いて
$
    fpropf(k)
    = (-1)/((k_0-Ek+i epsilon)(k_0+Ek-i epsilon))
    = (-1)/(k^2-m^2 +2i epsilon Ek) + O(epsilon^2)
$  
となる．$Ek eq.gt 0$であることを考えれば$2epsilon Ek arrow.r epsilon$
という置き換えをしても同じであり，
$
   fpropf(k) = (-1)/(k^2-m^2+i epsilon) 
$
と書ける．上では計算の正当化のために一応微小パラメータに物理的意味付けを与えたが
これ以降は$epsilon$は単なる微小パラメータと考える．
なお極限と積分の交換より重要なことは
footnote(
そもそも積分経路の上に極があるのでちょっとずらしますというのがやはり（数学的には）だいぶひどい．
というわけで数学的なことは忘れて一応「逆フーリエ変換」が求まって実験とあう（らしい）
ことのみを頼みとしなくてはならない．
)
この運動量空間でのプロパゲーターが実空間でのプロパゲーターと（逆）フーリエ変換で
つながっているということであり
上のように書かれた
運動量空間でのファインマンプロパゲーターにおいて$epsilon$の符号には注意していかなくてはならない．
例えば計量の符号が変わって$eta^(mu nu) = "diag" (-1, 1,1,1)$
となることとがあるかもしれない．
その時でも$k_0^2$ の符号と $i epsilon$の符号がそろうようにしなくてはならない．
subsection($T$-積および$T^(*)$-積)
上述の議論を敷衍して時空の複数の点で生成消滅が起きるような事象の振幅も考えることができる．
例えば$4$つの場の演算子が含まれるような生成消滅現象の振幅$cal(A)^((4))$は
$
cal(A)^((4))(x_1, x_2, x_3, x_4) 
&= sum_(P in P_4)
bra(0)
theta(t_(P(1)) - t_(P(2)))theta(t_(P(2))-t_(P(3)))theta(t_(P(3))-t_(P(4))) \
 
&times phi(x_(P(1)))phi(x_(P(2)))phi(x_(P(3)))phi(x_(P(4)))
ket(0)
$
と書ける．ここで$P_4$は$(1,2,3,4)$に対する入れ替えすべてからなる集合である．
和の記法を使って書いても煩わしい表式であるがこれをさらにあらわに書くとなると
実際に書き下すのが現実的ではないくらいに項数が多くなる．
実際項数は生成消滅イベントの数を$N$とすると$N!$個になる．
そこで以下のような$T$-積と呼ばれる記法を導入する．
$T$-積とは場の演算子の積が並んでいるという文脈において
記号$T$の後ろに並んでいる演算子を時刻が後のものが左に来るように並べ替える記法のことである．
例えば$T$の後に演算子が二つ並んでいる例では
$
    T phi(x)phi(y)
    =
    theta(x^0 > y^0) phi(x)phi(y)
    + theta(y^0 > x^0) phi(y)phi(x)
$
である．
この記法を用いるとファインマンプロパゲーターは
$
    fprop(x-y) = i mel("T" phi(x)phi(y), 0, 0)
$
とコンパクトに書ける．

ここで導入した$T$-積は時間にかかわる操作を含んでおり時間微分を考える際に注意が必要である．
例えば$partial_(x^0)T A(x)B(y)$を考えると$T$-積をあらわに展開した時の
時間に関する階段関数にも作用するので
$partial_(x^0)T A(x)B(y) eq.not T dot(A(x))B(y)$ である．
一方でのちにみるように$T$-積の中で時間微分が発生した時，
$T$-積の左側に微分演算子を出してそういった階段関数への寄与も考慮することにしておいたほうが
有用である（ことがわかるらしいのでそこで定義してほしかった）．
そのために$T$積の並べ替えの規則に加えて$T$-積の中で時間微分が
発生した時にはその時間微分を$T$-積の左側に書き直すという規則を追加したものを
$T^(*)$-積または
共変的時間順序積（Covariant time-ordered product）という．
例えば
$
T^(*)dot(phi)(x)dot(phi)(y) 
arrow.r 
(partial)/(partial x^0)
(partial)/(partial y^0)
T phi(x)phi(y)
$
などとなる．
以降の節では$T$-積の定義を$T^*$-積の定義で上書きする．
ファインマンプロパゲーターは時間微分を含まないのでこの変更の影響を受けず
引き続き式(ref(fprop_by_T))の形で書ける．

