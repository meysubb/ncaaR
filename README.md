README
================
Meyappan Subbaiah
August 28, 2017

ncaaR
=====

This R package provides easy access to college sports (NCAA) data via stats.ncaa.org. Note if you are trying to get baseball data, I would look at Bill Petti's [baseballr](http://billpetti.github.io/baseballr/) pkg.

Here are the list of sports that this package covers.

    ##                      names  id
    ## 1                 baseball MBA
    ## 2          mens basketball MBB
    ## 3                 football MFB
    ## 4          mens ice hockey MIH
    ## 5            mens lacrosse MLA
    ## 6              mens soccer MSO
    ## 7              mens tennis MTE
    ## 8          mens volleyball MVB
    ## 9        womens basketball WBB
    ## 10            field hockey WFH
    ## 11       womens ice hockey WIH
    ## 12         womens lacrosse WLA
    ## 13                softball WSB
    ## 14           womens soccer WSO
    ## 15 womens beach volleyball WSV
    ## 16           womens tennis WTE
    ## 17       womens volleyball WVB

Also this package will scale to more years as the NCAA makes data available. Right now stats.ncaa.org is slowly providing more data! VERY EXCITING!

Install
-------

``` r
# from github:
# devtools::install_github("meysubb/ncaaR")
```

Example
-------

I'll put together a Vignette once a few more functions are finished up.

Let's try and run something.

``` r
teams <- team_mapping(2016,"Men's Basketball")
head(teams,6)
```

    ##   team_id         team_name year
    ## 4   26172  A&M-Corpus Chris 2016
    ## 5       2 Abilene Christian 2016
    ## 6     721         Air Force 2016
    ## 7       5             Akron 2016
    ## 8       8           Alabama 2016
    ## 9       6       Alabama A&M 2016

I like Texas A&M for obvious reasons. So we'll go with them, for reference the TAMU id is 697 across all sports.

TAMU Women Soccer's season stats in 2015 look like:

``` r
team_season_stats(697, 2015, "Women's Soccer")
```

    ##             Player Goals Assists Points ShAtt Fouls Red Cards Yellow Cards
    ## 25          Totals    71      60    202   544   217        NA           10
    ## 26 Opponent Totals    27      22     76   296   297         1           27
    ##    GC Goal App GGS Goalie Min. Plyd GA   GAA Saves SV Pct Shutouts G Wins
    ## 25 NA       NA  NA          148,148 27 0.984    87  0.763        9     NA
    ## 26 NA       NA  NA          148,148 71 2.588   184  0.722        1     NA
    ##    G Loss DSaves Corners PS PSA GWG year
    ## 25     NA     NA     156  1   2  22 2015
    ## 26     NA     NA     105  1   1   3 2015

Alright the Aggies had a good basketball team in 2015-2016, let's look at the player's season stat. Note for seasons Year1-Year2, Year2 is what you want to use in the functions. For example the 2015 to 2016 season is denoted for 2016.

``` r
kable(player_season_stats(697,2016,"MBB"))
```

| Jersey | Player                | Yr  | Pos | Ht   | GP  | GS  | MP      |  FGM| FGA |    FG%|  3FG|  3FGA|   3FG%|   FT|  FTA|    FT%| PTS |    Avg|  ORebs|  DRebs| Tot Reb |   Avg|  AST|   TO|  STL|  BLK|  Fouls|  Dbl Dbl| Trpl Dbl |   DQ|  year|
|:-------|:----------------------|:----|:----|:-----|:----|:----|:--------|----:|:----|------:|----:|-----:|------:|----:|----:|------:|:----|------:|------:|------:|:--------|-----:|----:|----:|----:|----:|------:|--------:|:---------|----:|-----:|
| 01     | Hogg, DJ              | Fr  | G   | 6-8  | 37  | 3   | 673:00  |   81| 212 |  38.21|   46|   139|  33.09|   22|   34|  64.71| 230 |   6.22|     28|     78| 106     |  2.86|   35|   24|   20|    5|     44|       NA| NA       |   NA|  2016|
| 21     | Caruso, Alex          | Sr  | G   | 6-5  | 37  | 37  | 1067:00 |  111| 221 |  50.23|   28|    76|  36.84|   51|   65|  78.46| 301 |   8.14|     40|     94| 134     |  3.62|  185|   87|   77|   14|     92|       NA| NA       |   NA|  2016|
| 10     | Trocha-Morelos, Tonny | So  | C   | 6-10 | 37  | 11  | 644:00  |  103| 223 |  46.19|   30|    81|  37.04|   24|   48|  50.00| 260 |   7.03|     61|     96| 157     |  4.24|   37|   27|   15|   23|     67|        1| NA       |   NA|  2016|
| 11     | Collins, Anthony      | Sr  | G   | 6-1  | 37  | 37  | 950:00  |   52| 138 |  37.68|   28|    62|  45.16|   34|   39|  87.18| 166 |   4.49|      7|     47| 54      |  1.46|  155|   53|   38|    4|     72|       NA| NA       |   NA|  2016|
| 03     | Gilder, Admon         | Fr  | G   | 6-3  | 37  | 0   | 755:00  |   87| 202 |  43.07|   35|   101|  34.65|   51|   67|  76.12| 260 |   7.03|     16|     70| 86      |  2.32|   50|   27|   34|    5|     57|       NA| NA       |   NA|  2016|
| 34     | Davis, Tyler          | Fr  | C   | 6-10 | 36  | 34  | 820:00  |  150| 229 |  65.50|   NA|    NA|     NA|  105|  168|  62.50| 405 |  11.25|    106|    118| 224     |  6.22|   26|   58|   20|   41|     95|        2| NA       |   NA|  2016|
| 23     | House, Danuel         | Sr  | G   | 6-7  | 36  | 34  | 1114:00 |  185| 467 |  39.61|   75|   243|  30.86|  118|  165|  71.52| 563 |  15.64|     40|    132| 172     |  4.78|   77|   64|   19|   11|     51|       NA| NA       |   NA|  2016|
| 42     | Miller, Tavario       | Jr  | F   | 6-7  | 36  | 1   | 387:00  |   24| 54  |  44.44|   NA|    NA|     NA|   26|   48|  54.17| 74  |   2.06|     43|     89| 132     |  3.67|   12|   30|   10|   12|     62|       NA| NA       |    2|  2016|
| 12     | Jones, Jalen          | Sr  | F   | 6-7  | 33  | 28  | 902:00  |  175| 412 |  42.48|   34|   105|  32.38|  120|  171|  70.18| 504 |  15.27|     64|    172| 236     |  7.15|   21|   53|   22|    9|     94|        5| NA       |    4|  2016|
| 25     | Dobbins, Kyle         | Sr  | G   | 6-0  | 16  | 0   | 28:00   |    4| 7   |  57.14|   NA|    NA|     NA|    8|   15|  53.33| 16  |   1.00|      2|      1| 3       |  0.19|    5|    6|    1|   NA|      2|       NA| NA       |   NA|  2016|
| 13     | Aparicio, Juan        | Sr  | G   | 6-4  | 13  | 0   | 22:00   |    2| 6   |  33.33|    1|     3|  33.33|   NA|    2|   0.00| 5   |   0.38|     NA|     NA|         |    NA|    1|    1|   NA|    1|      4|       NA| NA       |   NA|  2016|
| 33     | Distefano, TJ         | Fr  | G   | 6-2  | 11  | 0   | 14:00   |   NA| 3   |     NA|   NA|     1|   0.00|   NA|   NA|     NA|     |     NA|     NA|      2| 2       |  0.18|   NA|    2|   NA|   NA|      2|       NA| NA       |   NA|  2016|
| 15     | Thomas, Elijah        | Fr  | F   | 6-9  | 8   | 0   | 79:00   |   12| 19  |  63.16|   NA|    NA|     NA|    6|   18|  33.33| 30  |   3.75|      5|     15| 20      |  2.50|    6|    9|   NA|    8|     23|       NA| NA       |    2|  2016|
| 00     | Eubanks, Kobie        | N/A |     | -    | 8   | 0   | 36:00   |    4| 12  |  33.33|    4|    11|  36.36|   NA|   NA|     NA| 12  |   1.50|      2|      8| 10      |  1.25|    3|    1|    3|   NA|      2|       NA| NA       |   NA|  2016|
| 22     | Byers, Frank          | Fr  | G   | 5-9  | 8   | 0   | 9:00    |    1| 3   |  33.33|   NA|     1|   0.00|   NA|    1|   0.00| 2   |   0.25|     NA|     NA|         |    NA|   NA|   NA|    1|   NA|      1|       NA| NA       |   NA|  2016|

Lastly let's take a look at the schedule and results for the TAMU Women's VolleyBall team.

``` r
team_schedule(697,2016,"womens volleyball")
```

    ##         team       Date                     Opponent    site OT result
    ## 1  Texas A&M 08/28/2015                   @ Stanford    Away NA      L
    ## 2  Texas A&M 08/29/2015 Minnesota @ Stanford, Calif. Neutral NA      W
    ## 3  Texas A&M 09/05/2015            Abilene Christian    Home NA      W
    ## 4  Texas A&M 09/05/2015                  Wichita St.    Home NA      W
    ## 5  Texas A&M 09/06/2015               New Mexico St.    Home NA      W
    ## 6  Texas A&M 09/11/2015  Milwaukee @ Iowa City, Iowa Neutral NA      W
    ## 7  Texas A&M 09/11/2015   Iowa St. @ Iowa City, Iowa Neutral NA      L
    ## 8  Texas A&M 09/12/2015                       @ Iowa    Away NA      L
    ## 9  Texas A&M 09/15/2015                 Colorado St.    Home NA      W
    ## 10 Texas A&M 09/18/2015                @ Florida St.    Away NA      L
    ## 11 Texas A&M 09/19/2015                @ Florida A&M    Away NA      W
    ## 12 Texas A&M 09/27/2015                     Arkansas    Home NA      L
    ## 13 Texas A&M 09/30/2015                     @ Auburn    Away NA      W
    ## 14 Texas A&M 10/04/2015                     Ole Miss    Home NA      W
    ## 15 Texas A&M 10/09/2015                    @ Florida    Away NA      L
    ## 16 Texas A&M 10/11/2015             @ South Carolina    Away NA      W
    ## 17 Texas A&M 10/16/2015                      Alabama    Home NA      W
    ## 18 Texas A&M 10/18/2015              Mississippi St.    Home NA      W
    ## 19 Texas A&M 10/21/2015                          LSU    Home NA      W
    ## 20 Texas A&M 10/30/2015                   @ Kentucky    Away NA      W
    ## 21 Texas A&M 11/01/2015                  @ Tennessee    Away NA      W
    ## 22 Texas A&M 11/04/2015                     Missouri    Home NA      W
    ## 23 Texas A&M 11/08/2015                      Georgia    Home NA      W
    ## 24 Texas A&M 11/13/2015                   @ Ole Miss    Away NA      W
    ## 25 Texas A&M 11/15/2015            @ Mississippi St.    Away NA      W
    ## 26 Texas A&M 11/18/2015                     Kentucky    Home NA      W
    ## 27 Texas A&M 11/22/2015                      Florida    Home NA      W
    ## 28 Texas A&M 11/25/2015                   @ Missouri    Away NA      W
    ## 29 Texas A&M 11/28/2015                   @ Arkansas    Away NA      W
    ## 30 Texas A&M 12/04/2015             A&M-Corpus Chris    Home NA      W
    ## 31 Texas A&M 12/05/2015                       Hawaii    Home NA      L
    ##    Score team_score opp_score win loss
    ## 1  0 - 3          0         3   0    1
    ## 2  3 - 2          3         2   1    1
    ## 3  3 - 1          3         1   2    1
    ## 4  3 - 0          3         0   3    1
    ## 5  3 - 2          3         2   4    1
    ## 6  3 - 1          3         1   5    1
    ## 7  1 - 3          1         3   5    2
    ## 8  1 - 3          1         3   5    3
    ## 9  3 - 2          3         2   6    3
    ## 10 1 - 3          1         3   6    4
    ## 11 3 - 0          3         0   7    4
    ## 12 1 - 3          1         3   7    5
    ## 13 3 - 0          3         0   8    5
    ## 14 3 - 0          3         0   9    5
    ## 15 0 - 3          0         3   9    6
    ## 16 3 - 2          3         2  10    6
    ## 17 3 - 0          3         0  11    6
    ## 18 3 - 0          3         0  12    6
    ## 19 3 - 0          3         0  13    6
    ## 20 3 - 1          3         1  14    6
    ## 21 3 - 0          3         0  15    6
    ## 22 3 - 0          3         0  16    6
    ## 23 3 - 0          3         0  17    6
    ## 24 3 - 2          3         2  18    6
    ## 25 3 - 0          3         0  19    6
    ## 26 3 - 0          3         0  20    6
    ## 27 3 - 2          3         2  21    6
    ## 28 3 - 2          3         2  22    6
    ## 29 3 - 1          3         1  23    6
    ## 30 3 - 0          3         0  24    6
    ## 31 0 - 3          0         3  24    7

Functionality
-------------

This package should be functional for all sports except for Football. The next update should have full functionality for Football as well.

There are three main functions that provide data of interest:
(1) team\_season\_stats = Overall team stats
(2) player\_season\_stats = Full season player stats
(3) team\_schedule = Team Schedule/Result/Site/Record

Future Work
-----------

I'm looking to add functionality. What you should expect shortly:
(1) game\_by\_game = Team stats by game.
(2) player\_ind\_stats = An individual player's stats by game.
(3) College Football Functionality.

If you'd like to suggest anything (can be sport specific or general), create a github issue. Or tweet at me @msubbaiah1.
