/// 
Class dc.data.health.BreastCancer Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {irisowner}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = BreastCancer ]
{

Property diagnosis As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 2 ];

Property radiusmean As %Library.Currency [ SqlColumnNumber = 3 ];

Property texturemean As %Library.Currency [ SqlColumnNumber = 4 ];

Property perimetermean As %Library.Double [ SqlColumnNumber = 5 ];

Property areamean As %Library.Double [ SqlColumnNumber = 6 ];

Property smoothnessmean As %Library.Currency [ SqlColumnNumber = 7 ];

Property compactnessmean As %Library.Currency [ SqlColumnNumber = 8 ];

Property concavitymean As %Library.Currency [ SqlColumnNumber = 9 ];

Property concavepointsmean As %Library.Currency [ SqlColumnNumber = 10 ];

Property symmetrymean As %Library.Currency [ SqlColumnNumber = 11 ];

Property fractaldimensionmean As %Library.Currency [ SqlColumnNumber = 12 ];

Property radiusse As %Library.Currency [ SqlColumnNumber = 13 ];

Property texturese As %Library.Currency [ SqlColumnNumber = 14 ];

Property perimeterse As %Library.Currency [ SqlColumnNumber = 15 ];

Property arease As %Library.Currency [ SqlColumnNumber = 16 ];

Property smoothnessse As %Library.Currency [ SqlColumnNumber = 17 ];

Property compactnessse As %Library.Currency [ SqlColumnNumber = 18 ];

Property concavityse As %Library.Currency [ SqlColumnNumber = 19 ];

Property concavepointsse As %Library.Currency [ SqlColumnNumber = 20 ];

Property symmetryse As %Library.Currency [ SqlColumnNumber = 21 ];

Property fractaldimensionse As %Library.Currency [ SqlColumnNumber = 22 ];

Property radiusworst As %Library.Currency [ SqlColumnNumber = 23 ];

Property textureworst As %Library.Currency [ SqlColumnNumber = 24 ];

Property perimeterworst As %Library.Currency [ SqlColumnNumber = 25 ];

Property areaworst As %Library.Double [ SqlColumnNumber = 26 ];

Property smoothnessworst As %Library.Currency [ SqlColumnNumber = 27 ];

Property compactnessworst As %Library.Currency [ SqlColumnNumber = 28 ];

Property concavityworst As %Library.Currency [ SqlColumnNumber = 29 ];

Property concavepointsworst As %Library.Currency [ SqlColumnNumber = 30 ];

Property symmetryworst As %Library.Currency [ SqlColumnNumber = 31 ];

Property fractaldimensionworst As %Library.Currency [ SqlColumnNumber = 32 ];

Parameter USEEXTENTSET = 1;

/// Bitmap Extent Index auto-generated by DDL CREATE TABLE statement.  Do not edit the SqlName of this index.
Index DDLBEIndex [ Extent, SqlName = "%%DDLBEIndex", Type = bitmap ];

Storage Default
{
<Data name="BreastCancerDefaultData">
<Value name="1">
<Value>diagnosis</Value>
</Value>
<Value name="2">
<Value>radiusmean</Value>
</Value>
<Value name="3">
<Value>texturemean</Value>
</Value>
<Value name="4">
<Value>perimetermean</Value>
</Value>
<Value name="5">
<Value>areamean</Value>
</Value>
<Value name="6">
<Value>smoothnessmean</Value>
</Value>
<Value name="7">
<Value>compactnessmean</Value>
</Value>
<Value name="8">
<Value>concavitymean</Value>
</Value>
<Value name="9">
<Value>concavepointsmean</Value>
</Value>
<Value name="10">
<Value>symmetrymean</Value>
</Value>
<Value name="11">
<Value>fractaldimensionmean</Value>
</Value>
<Value name="12">
<Value>radiusse</Value>
</Value>
<Value name="13">
<Value>texturese</Value>
</Value>
<Value name="14">
<Value>perimeterse</Value>
</Value>
<Value name="15">
<Value>arease</Value>
</Value>
<Value name="16">
<Value>smoothnessse</Value>
</Value>
<Value name="17">
<Value>compactnessse</Value>
</Value>
<Value name="18">
<Value>concavityse</Value>
</Value>
<Value name="19">
<Value>concavepointsse</Value>
</Value>
<Value name="20">
<Value>symmetryse</Value>
</Value>
<Value name="21">
<Value>fractaldimensionse</Value>
</Value>
<Value name="22">
<Value>radiusworst</Value>
</Value>
<Value name="23">
<Value>textureworst</Value>
</Value>
<Value name="24">
<Value>perimeterworst</Value>
</Value>
<Value name="25">
<Value>areaworst</Value>
</Value>
<Value name="26">
<Value>smoothnessworst</Value>
</Value>
<Value name="27">
<Value>compactnessworst</Value>
</Value>
<Value name="28">
<Value>concavityworst</Value>
</Value>
<Value name="29">
<Value>concavepointsworst</Value>
</Value>
<Value name="30">
<Value>symmetryworst</Value>
</Value>
<Value name="31">
<Value>fractaldimensionworst</Value>
</Value>
</Data>
<DataLocation>^CVu6.BiHE.1</DataLocation>
<DefaultData>BreastCancerDefaultData</DefaultData>
<ExtentLocation>^CVu6.BiHE</ExtentLocation>
<ExtentSize>569</ExtentSize>
<IdFunction>sequence</IdFunction>
<IdLocation>^CVu6.BiHE.1</IdLocation>
<Index name="DDLBEIndex">
<Location>^CVu6.BiHE.2</Location>
</Index>
<Index name="IDKEY">
<Location>^CVu6.BiHE.1</Location>
</Index>
<IndexLocation>^CVu6.BiHE.I</IndexLocation>
<Property name="%%ID">
<AverageFieldSize>3.55</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,38,76,114,152,190,228,266,304,342,380,418,456,494,532,569),$lb(0,0,0,1,1,0,1,0,1,1,0,1,1,0,1),$lb(822083584,822083584,859308032,859308032,926285824,926285824,825308160,825491456,892469248,892469248,959447040,825831424,842151936,842530816,909508608,842413568,858797056,808714240,875692032,875692032,942669824,859320320,875640832,825753600,892731392,892731392,959709184,876164096,892547584,858914816,909705216,892745984))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="areamean">
<AverageFieldSize>10</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb($double(143.5),$double(289.69999999999998863),$double(358.89999999999997726),$double(396.5),$double(427.89999999999997726),$double(462),$double(496.39999999999997726),$double(529.39999999999997726),$double(571),$double(609.89999999999997726),$double(671.39999999999997726),$double(748.89999999999997726),$double(918.60000000000002273),$double(1092),$double(1265),$double(2501)),$lb(8,8,9,8,9,9,8,9,8,9,8,8,8,9,8),$lb(825504558,0,960051513,960051513,960051513,960051513,0,0,960051513,960051513,0,0,960051513,960051513,960051513,960051513,0,0,960051513,960051513,960051513,960051513,960051513,960051513,808464432,808464432,0,0,0,0,0,842346545))</Histogram>
<Selectivity>0.1855%</Selectivity>
</Property>
<Property name="arease">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(6.802,11.88,14.34,16.64,18.21,19.75,21.05,23.22,26.03,29.34,34.37,43.52,54.16,76.36,104.9,542.2),$lb(0,1,1,1,1,0,1,1,1,0,0,0,0,0,0),$lb(908998704,908998704,825306680,825112632,875442996,875442996,908998196,908998196,942551601,942551601,959330101,825830967,842083888,825110581,858665522,858665522,908996659,908996659,959329076,842608179,859057715,859057715,875769397,875769397,892612145,892612145,926297651,926297651,825242670,825242670,892613166,892613166))</Histogram>
<Selectivity>0.1894%</Selectivity>
</Property>
<Property name="areaworst">
<AverageFieldSize>10</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb($double(185.19999999999998863),$double(357.10000000000002273),$double(424.80000000000001136),$double(475.80000000000001136),$double(521.5),$double(553),$double(599.5),$double(653.29999999999995452),$double(708.79999999999995452),$double(782.10000000000002273),$double(862),$double(1021),$double(1269),$double(1589),$double(1873),$double(4254)),$lb(8,8,9,8,9,9,8,8,9,8,8,9,9,9,8),$lb(825767214,960051513,808464432,808464432,808464432,808464432,808464432,808464432,0,0,0,0,0,0,960051513,960051513,960051513,960051513,808464432,808464432,0,0,0,0,0,0,0,0,0,0,0,875705652))</Histogram>
<Selectivity>0.1838%</Selectivity>
</Property>
<Property name="compactnessmean">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0194,.0434,.0525,.0596,.0668,.0733,.0795,.0864,.0982,.1088,.1157,.1289,.1428,.1642,.1972,.3454),$lb(2,2,3,2,2,3,2,2,1,2,2,2,2,2,1),$lb(774910265,825832448,875770880,875770880,892482816,842334208,959840256,892941824,909522944,909522944,926102272,858980352,959774720,926496000,943076352,943076352,959984128,809056306,825243704,808990720,825571072,825571072,842545408,842545408,875706368,875706368,909390336,909390336,959918592,825833266,859059508,775107637))</Histogram>
<Selectivity>0.2045%</Selectivity>
</Property>
<Property name="compactnessse">
<AverageFieldSize>4.38</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0023,.0082,.0104,.0118,.0137,.0149,.017,.0191,.0218,.0245,.0281,.0317,.0363,.0424,.0559,.1354),$lb(3,2,3,3,3,3,3,2,3,3,2,3,2,2,1),$lb(774910002,842203136,942800896,808989184,825242624,808714240,825753600,825753600,859242496,859242496,876150784,876150784,922746880,922746880,959512576,825831680,842086400,825753600,875888640,875888640,942735360,842543360,858863360,825688064,909312000,859190016,875705344,875705344,892680448,808793401,825439540,774976309))</Histogram>
<Selectivity>0.3012%</Selectivity>
</Property>
<Property name="compactnessworst">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0273,.0777,.1026,.1256,.1508,.1678,.1845,.2037,.225,.2515,.2817,.3235,.3682,.4186,.5209,1.058),$lb(2,1,2,2,2,2,1,2,2,2,1,2,1,1,0),$lb(774910519,842478336,926365440,808924983,825242166,808596992,842348032,842348032,892352512,892352512,909588480,909588480,942945536,825766965,842019639,808662784,842334208,842334208,892417280,892417280,942749440,842543415,858927925,842216704,909652480,859191346,875640886,875640886,892481593,775238192,825110581,825110581))</Histogram>
<Selectivity>0.1905%</Selectivity>
</Property>
<Property name="concavepointsmean">
<AverageFieldSize>4.62</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,.0076,.0134,.0179,.0209,.024,.028,.031,.0375,.0484,.0584,.0686,.0847,.0943,.1155,.2012),$lb(0,2,3,2,3,3,2,3,2,2,2,2,2,1,1),$lb(805306368,805306368,774910007,808924672,825439232,859045888,926482432,825702656,842021120,809041920,872415232,872415232,939524096,842530816,858849280,822083584,926220288,859256064,876098560,876098560,892875776,892875776,909653504,909653504,942946048,942946048,959722240,809055283,825308469,825308469,842019122,775041073))</Histogram>
<OutlierSelectivity>.022847:0</OutlierSelectivity>
<Selectivity>0.2349%</Selectivity>
</Property>
<Property name="concavepointsse">
<AverageFieldSize>4.01</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,.0048,.0061,.0069,.008,.0089,.0096,.0105,.0114,.0124,.0133,.0144,.0158,.0177,.0214,.0528),$lb(0,3,4,3,4,3,2,3,3,3,3,3,3,2,2),$lb(805306368,805306368,774910004,876085248,909180928,822083584,956301312,909705216,939524096,0,956301312,943259648,959840256,809055744,825242880,808779776,825491456,825491456,842268672,842268672,858980352,858980352,875823104,875823104,892862464,892862464,926351360,825702144,842085376,842085376,892483584,774911282))</Histogram>
<Selectivity>0.5000%</Selectivity>
</Property>
<Property name="concavepointsworst">
<AverageFieldSize>4.92</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,.0278,.0472,.058,.0656,.0786,.0839,.0933,.1056,.1218,.1424,.1571,.1776,.1984,.2248,.291),$lb(0,2,2,2,2,2,2,1,2,2,2,2,2,1,2),$lb(805306368,805306368,774910519,842479616,876032512,876032512,892862464,892862464,909456896,909456896,926430720,926430720,942881024,942881024,959656704,809055027,825242934,808793600,842086400,842086400,875705344,875705344,892809472,892809472,926365184,926365184,959984640,825833524,842150968,842283008,959512576,775043377))</Histogram>
<OutlierSelectivity>.022847:0</OutlierSelectivity>
<Selectivity>0.2097%</Selectivity>
</Property>
<Property name="concavitymean">
<AverageFieldSize>4.77</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,.0078,.0177,.0249,.0305,.038,.0451,.055,.0684,.0863,.1029,.1204,.1508,.1799,.2273,.4268),$lb(0,2,2,2,3,2,2,2,2,1,2,2,2,1,1),$lb(805306368,805306368,774910007,808925184,825702144,825702144,842283264,842283264,858797312,808779776,939524096,859308032,875901184,875901184,892665856,892665856,909652992,909652992,943076096,808990259,825242169,808597760,842019840,842019840,892352512,892352512,926497024,825702713,842151731,842151731,875705912,775172662))</Histogram>
<OutlierSelectivity>.022847:0</OutlierSelectivity>
<Selectivity>0.2019%</Selectivity>
</Property>
<Property name="concavityse">
<AverageFieldSize>4.48</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,.0053,.01,.0131,.0156,.0183,.0205,.0234,.0271,.0306,.0348,.04,.0464,.0532,.0712,.396),$lb(0,2,3,3,3,2,3,3,2,3,2,3,2,2,1),$lb(805306368,805306368,774910005,808792832,822083584,0,858849280,858849280,892731392,892731392,942866432,825766656,842020096,808779776,859045888,859045888,925958144,842477824,858797568,808845312,876085248,859060224,872415232,0,909377536,875967488,892547584,892547584,925970944,808923442,859387392,775108918))</Histogram>
<OutlierSelectivity>.022847:0</OutlierSelectivity>
<Selectivity>0.2627%</Selectivity>
</Property>
<Property name="concavityworst">
<AverageFieldSize>4.91</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,.0253,.0626,.0919,.1212,.1456,.1769,.206,.2456,.2866,.3308,.3759,.4211,.5106,.6399,1.252),$lb(0,2,2,1,2,2,1,2,2,1,2,1,1,1,0),$lb(805306368,805306368,774910517,842347264,909260288,909260288,959527168,809054521,825372978,842084864,875902464,875902464,926300416,825701945,842020352,808845312,875902464,875902464,943076864,842544694,858992696,858798080,926234880,859256121,875704625,875704625,892416054,892416054,909326649,775303993,825111093,825111093))</Histogram>
<OutlierSelectivity>.022847:0</OutlierSelectivity>
<Selectivity>0.1833%</Selectivity>
</Property>
<Property name="diagnosis">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" B"," B"," B"," B"," B"," B"," B"," B"," B"," B"," M"," M"," M"," M"," M"," M"),$lb(3,3,3,3,3,3,3,3,3,1,3,3,3,3,3),$lb(541196288,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1107296256,1291845632,0,0,0,0,0,0,0,0,0,0,541917184))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="fractaldimensionmean">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.05,.0545,.0559,.0568,.0583,.0591,.0602,.0611,.0621,.0632,.0644,.0658,.0677,.0702,.0741,.0974),$lb(3,3,3,3,3,2,3,3,3,3,3,3,2,3,2),$lb(774911232,0,875888640,875888640,892928000,892928000,909639680,909639680,942866432,942866432,959512576,892940544,909128192,808583168,825294848,825294848,842072064,842072064,858914816,858914816,875823104,875823104,892862464,892862464,926351360,909588224,925905408,808583168,875626496,926167296,959919104,774912311))</Histogram>
<Selectivity>0.4386%</Selectivity>
</Property>
<Property name="fractaldimensionse">
<AverageFieldSize>4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0009,.0016,.0018,.0021,.0023,.0025,.0028,.003,.0033,.0036,.004,.0044,.0048,.0058,.0074,.0298),$lb(3,4,3,4,4,4,3,4,4,3,4,4,3,3,2),$lb(774910000,809041920,825622528,905969664,939524096,825753600,842072064,822083584,855638016,855638016,889192448,889192448,939524096,842530816,855638016,0,855638016,855638016,905969664,859176960,872415232,0,872415232,872415232,939524096,876085248,892862464,892862464,926154752,808924160,842610688,774910521))</Histogram>
<Selectivity>1.0870%</Selectivity>
</Property>
<Property name="fractaldimensionworst">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.055,.0639,.0674,.0696,.0722,.0746,.0769,.0787,.0812,.0832,.0872,.0914,.0961,.1027,.1155,.2075),$lb(2,3,3,2,3,3,3,2,3,3,2,3,1,2,1),$lb(774911285,892665856,909326592,859373568,926154752,926154752,959840256,909719040,926036480,842137600,875954176,875954176,909705216,909705216,943128576,926430976,942748160,825360384,858914816,858914816,926023680,943141376,959525888,825491456,909180928,809055793,825242167,808597248,825570560,825308469,842020661,775041079))</Histogram>
<Selectivity>0.2833%</Selectivity>
</Property>
<Property name="perimetermean">
<AverageFieldSize>10</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb($double(43.789999999999999147),$double(61.679999999999999716),$double(68.890000000000000568),$double(73.280000000000001136),$double(75.890000000000000568),$double(78.540000000000006252),$double(81.920000000000001706),$double(84.549999999999997157),$double(87.760000000000005116),$double(91.430000000000006821),$double(96.219999999999998863),$double(102.70000000000000284),$double(111.79999999999999716),$double(123.40000000000000568),$double(133.80000000000001136),$double(188.5)),$lb(8,9,8,9,9,8,9,9,8,9,8,9,9,9,9),$lb(875769399,960051513,960051513,960051513,808464432,808464432,808464432,808464432,808464432,808464432,808464432,808464432,808464432,808464432,960051513,960051513,808464432,808464432,808464432,808464432,960051513,960051513,808464432,808464432,960051513,960051513,808464432,808464432,808464432,808464432,0,825767982))</Histogram>
<Selectivity>0.1916%</Selectivity>
</Property>
<Property name="perimeterse">
<AverageFieldSize>5.05</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.757,1.174,1.372,1.516,1.661,1.831,2.039,2.203,2.388,2.591,2.888,3.258,3.769,4.585,6.051,21.98),$lb(0,2,2,2,2,0,2,2,2,2,0,2,0,0,0),$lb(775370039,775370039,825110839,825701376,859255296,859255296,892417536,892417536,909521152,909521152,942878976,825112627,841887795,808663296,842019584,842019584,859322368,859322368,892940544,892940544,943208448,841889848,858665525,842348544,926300416,858666806,875443512,875443512,908996661,908996661,842083897,842083897))</Histogram>
<Selectivity>0.1876%</Selectivity>
</Property>
<Property name="perimeterworst">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(50.41,69.35,76.25,81.39,84.58,87.4,91.29,95.54,99.66,105.8,113.1,123.4,133.5,150.6,166.1,251.2),$lb(0,0,0,1,1,0,1,1,0,1,1,1,1,1,0),$lb(892350004,892350004,909717043,909717043,926297650,926297650,942747187,825111353,875443512,875443512,925774848,943140404,959524402,825111097,892220724,892220724,959329846,960048694,825242926,808791608,825437745,825437745,842214964,842214964,858992181,858992181,892350006,892350006,909520433,825636398,842346798,842346798))</Histogram>
<Selectivity>0.1946%</Selectivity>
</Property>
<Property name="radiusmean">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(6.981,9.738,10.8,11.36,11.76,12.25,12.72,13.11,13.61,14.06,14.78,15.53,17.08,18.77,20.29,28.11),$lb(0,0,1,3,1,3,1,3,1,3,1,1,1,0,1),$lb(908998968,908998968,959330099,959330099,825241144,808335360,825111350,859176960,926285824,825112374,841888309,842334208,926023680,841889586,858665265,825294848,909180928,858666545,875442230,808845312,926416896,875444024,892220723,892220723,925773880,925773880,942552887,825765431,842018354,808333881,942551345,842542641))</Histogram>
<Selectivity>0.2193%</Selectivity>
</Property>
<Property name="radiusse">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.1115,.1705,.1931,.2191,.2366,.256,.28,.3077,.3354,.3699,.4101,.4653,.5462,.6592,.8529,2.873),$lb(2,2,1,2,2,2,1,2,2,1,2,1,1,1,0),$lb(774975793,825308416,925906176,925906176,959656192,825832241,842086705,825831680,859190784,859190784,892731392,892731392,939524096,842530816,858797879,808924928,859124736,859124736,909719808,859191609,875638833,825241856,909456128,875967795,892614194,892614194,909457714,909457714,943010361,775435570,841889847,841889847))</Histogram>
<Selectivity>0.1852%</Selectivity>
</Property>
<Property name="radiusworst">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(7.93,10.83,11.86,12.48,13.09,13.46,14,14.62,15.2,16.01,16.82,18.13,20.33,22.66,24.99,36.04),$lb(0,1,1,1,3,1,2,1,1,3,1,0,1,1,0),$lb(925776179,925776179,825241144,808335411,825112630,825112630,841888824,841888824,858665017,809041920,875954176,858666038,872415232,0,775303680,875443762,892219904,892219904,908996657,808517632,942800896,908998706,942551347,825765425,842018355,808334131,841889334,841889334,875444537,842280505,859188784,859188784))</Histogram>
<Selectivity>0.2188%</Selectivity>
</Property>
<Property name="smoothnessmean">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0526,.077,.0812,.0842,.0868,.0893,.0918,.0945,.0973,.0993,.1018,.1046,.1075,.1121,.117,.1634),$lb(2,2,3,3,3,2,3,3,3,1,3,3,2,3,2),$lb(774911282,892483072,926351360,926351360,942748160,825360384,875692032,875692032,909639680,909639680,959643648,943272704,959526912,825753600,875888640,875888640,926089216,926089216,959643648,809056563,825241912,825753600,875954176,875954176,926220288,808924416,825372928,842072064,922746880,825688064,909325312,774977075))</Histogram>
<Selectivity>0.2933%</Selectivity>
</Property>
<Property name="smoothnessse">
<AverageFieldSize>4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0017,.0039,.0044,.0049,.0053,.0055,.0058,.0061,.0065,.007,.0074,.008,.0088,.0099,.0116,.0311),$lb(3,3,4,3,4,4,3,4,3,4,3,4,3,2,2),$lb(774910001,825688064,859373568,859373568,875823104,872415232,956301312,876150784,892534784,855638016,889192448,889192448,939524096,892862464,909180928,822083584,889192448,909443072,922746880,0,872415232,926154752,939524096,0,939524096,943194112,960036864,809056512,825308672,825308672,858861824,774910769))</Histogram>
<Selectivity>0.8547%</Selectivity>
</Property>
<Property name="smoothnessworst">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0712,.0996,.1072,.1124,.1178,.1222,.1263,.1297,.134,.1377,.1413,.1446,.1502,.1552,.1679,.2226),$lb(2,1,2,3,2,3,3,2,3,2,3,2,3,2,1),$lb(774911793,925970944,960050688,809056566,825243442,808923648,825373696,842268672,926416896,825702400,842150400,842137600,909312000,909312000,959905792,842610432,859045888,872415232,926351360,859256576,875639552,825425920,875954176,875836928,892350976,808583168,892469248,892678656,909588736,825636665,842150454,775041586))</Histogram>
<Selectivity>0.2451%</Selectivity>
</Property>
<Property name="symmetrymean">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.106,.1453,.1533,.1587,.1632,.1675,.172,.177,.181,.1855,.1903,.1948,.2009,.2106,.2235,.304),$lb(2,2,3,2,3,2,3,2,3,2,3,1,2,2,1),$lb(774975542,808845312,875901696,875901696,892547840,858980352,943128576,892876544,909324800,858914816,926220288,909587712,926023680,838860800,922746880,926351360,942735360,822083584,892665856,943011072,959460096,808648704,876085248,825832504,842018873,808466688,825243136,825243136,842216704,842150709,858797056,775106612))</Histogram>
<Selectivity>0.2315%</Selectivity>
</Property>
<Property name="symmetryse">
<AverageFieldSize>4.2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.0079,.0122,.0135,.0145,.0153,.0161,.0172,.0184,.0191,.0201,.0214,.0229,.0257,.0277,.0336,.079),$lb(2,3,3,3,3,3,3,3,2,3,3,3,3,2,2),$lb(774910007,808925440,825373184,842137600,859111424,859111424,875888640,875888640,892534784,892534784,909180928,909180928,926023680,926023680,942931968,942931968,959512576,825831680,842019072,808517632,825491456,825491456,842596352,842596352,892796928,892796928,926351360,842479360,858994176,858994176,926482432,774911801))</Histogram>
<Selectivity>0.4405%</Selectivity>
</Property>
<Property name="symmetryworst">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.1565,.2179,.2311,.2435,.2523,.2608,.2694,.2779,.2851,.2965,.3057,.3153,.3258,.3469,.3828,.6638),$lb(1,2,2,2,2,3,2,2,2,1,2,2,2,2,1),$lb(774976822,825570869,842086201,825702656,858861824,858861824,875771136,875771136,892482304,892482304,909129728,808976384,959709184,909718528,926365952,926365952,943010048,943010048,959853824,842610229,858797367,808793856,825570048,825570048,842348544,842348544,875968768,875968768,942815232,859320888,909521720,775304755))</Histogram>
<Selectivity>0.2000%</Selectivity>
</Property>
<Property name="texturemean">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(9.71,13.29,14.71,15.65,16.39,17.19,17.91,18.57,19.13,19.97,20.74,21.59,22.44,24.02,26.6,39.28),$lb(0,1,1,1,1,3,1,1,3,0,1,1,1,1,0),$lb(959330097,959330097,825437746,858665529,875444017,875444017,892220981,892220981,908997433,908997433,925774137,825819136,959512576,925776177,942552375,942552375,959328563,825425920,959905792,825830969,842018359,808335156,825111865,825111865,841888820,841888820,875442226,875442226,908998144,842411574,859385394,859385394))</Histogram>
<Selectivity>0.2088%</Selectivity>
</Property>
<Property name="texturese">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.3602,.5762,.679,.78,.8561,.9238,1.005,1.059,1.161,1.239,1.343,1.452,1.563,1.781,2.079,4.885),$lb(1,1,1,1,1,0,3,2,2,2,2,2,2,0,0),$lb(775108144,859189298,892810802,892810802,909588736,909588736,926416896,926416896,943011377,943011377,959591224,775500339,825110576,808779776,892928000,808794368,825635072,825635072,842217728,842217728,859058944,859058944,875901440,875901440,892744448,892744448,926429440,825112376,841887799,841887799,875444280,875444280))</Histogram>
<Selectivity>0.1927%</Selectivity>
</Property>
<Property name="textureworst">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(12.02,16.94,18.91,20.14,21.4,22.47,23.58,24.99,25.75,26.76,27.99,29.25,30.92,32.68,35.34,49.54),$lb(1,1,0,1,1,1,1,1,1,1,1,0,1,1,0),$lb(825372208,841887794,908998964,908998964,942553393,825765433,842018353,808333620,825111552,825111552,841888823,841888823,858666296,858666296,875444537,875444537,892221237,892221237,908998454,908998454,925776185,925776185,959328821,842608178,858795577,808335666,841889336,841889336,892220212,859123251,876162613,876162613))</Histogram>
<Selectivity>0.1957%</Selectivity>
</Property>
<SQLMap name="%%DDLBEIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-56</BlockCount>
</SQLMap>
<StreamLocation>^CVu6.BiHE.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}