function f = get_fitting_params(q)
% The columns corresponds to N, q, s
global F;
if (isempty(F))
  F = [   2.76956339115566          10.0208598618409        -0.228696804217568
          4.12545416212796          6.16972201094306         0.382472603708833
          4.94672151384839          5.12966118480398         0.835088888971231
           4.2115723916614          4.37031414410813         0.577076965911087
          3.95692257848933          3.97716485595668         0.521882299019447
          3.63384379206511          3.65655387854377         0.420699897922066
          3.38259528142715          3.42272458538144         0.340428139843079
          3.21080679747645          3.25245051185722         0.291872290167167
          3.02848999627289          3.09354337146351         0.232332560258271
          2.85384599531365           2.9555415951095         0.170297104512106
          2.72103561748429          2.84796909137368         0.123576427223301
          2.63619768495855          2.76264957031006         0.102076412558954
          2.55169700767423          2.68414949962556         0.078254223279255
          2.48890159223525          2.62267792896151        0.0616904263691866
          2.41882206954518           2.5626705132633        0.0392916874955406
           2.3524648842031          2.50978185479499        0.0160360899708627
          2.30948058210218          2.45862056861502        0.0110793431737039
          2.27482268583276          2.42600797357164       0.00191775523298984
          2.23489579293763          2.39089060921812      -0.00999021095123987
          2.19405428329456          2.35459734928278       -0.0221674459407147
          2.16743750409475          2.32384003796989       -0.0254711504379495
          2.12406686031329          2.28920010240231       -0.0407182956687215
          2.10381036605017          2.26158606543459       -0.0403878473751348
          2.08583435879032          2.24145091349978       -0.0424415321865116
          2.05581129077668           2.2176206475126       -0.0529536779236049
          2.02592532318935          2.19328750711224       -0.0631174282509706
          2.00817222351145          2.17418219189753       -0.0658661147026317
          1.98155564248183          2.15130014877089         -0.07428133777547
          1.97423249719246          2.13762116218869       -0.0709829768532737
          1.95455653859773          2.12017318344789       -0.0764598633974789
          1.93090092749977          2.10331139873882       -0.0866967759440053
          1.92251471148046          2.09102118788549       -0.0854944909773387
          1.89932903065491          2.07077254818663       -0.0926456386485344
          1.89899301383333           2.0688967776631       -0.0915129395154881
          1.87158164664051          2.04606629904932        -0.100893380018883
          1.83947161986061          2.02313410017325        -0.115459266775652
          1.83014694485255          2.01774252335582        -0.120586713860366
          1.79104654944069          1.98786447748402        -0.136939547673135
          1.79515075335241          1.98860268450442        -0.132918985998398
          1.78758569481223          1.98210454317207        -0.135742328596246
          1.77241948881085          1.96825154021487        -0.139934319012931
          1.74526237092939          1.94912113978159        -0.152859291452256
          1.72820241829451          1.93883532671676        -0.162475419215552
          1.73208390173344          1.93489134877172        -0.155147902543196
          1.71558085629076          1.92446442803954        -0.163513850656025
           1.6960281427253          1.90834754109059        -0.171140877931975
          1.70926939126898          1.91325322202115        -0.161042692168168
          1.70338117416079          1.91123759829242        -0.165382807429896
          1.66047392310556          1.87620193536666        -0.182301790234081
          1.66393146069009          1.88099727709252        -0.182518432175629
          1.66611748906368           1.8851502626392        -0.183622325276946
           1.6356911496489          1.85723557490913        -0.193310694279713
           1.6108436108929          1.84537798302299        -0.210129081912367
          1.63036783896524          1.85361924384299        -0.195618320683471
          1.61969149276754          1.84551534771497        -0.200722550954205
          1.59141447798196          1.82701421023426        -0.216239346670388
          1.58101989469278          1.82037698629334        -0.221933540764976
          1.57510532600572          1.81077730335418        -0.220486116739895
           1.5517052393635          1.79928284687076        -0.236590144735869
          1.55023515202253          1.79592737872834        -0.235356563111442
          1.52919341556602          1.78106571471748        -0.246359241968426
          1.53638168175054          1.78341914521966        -0.240326513619424
          1.51590660742514          1.76841837353104        -0.250271144935056
          1.50555953649973          1.76231431097859        -0.256757859107598
          1.49857744026284          1.75327440913299        -0.256848228018188
          1.50528953128531          1.75653338004211        -0.251931143956676
          1.48019304534358          1.74330668249042        -0.269147112688855
          1.44955461665871          1.72095872757194        -0.285433371499832
          1.44904781712659          1.72120284052217        -0.286087763528326
          1.42319131108873          1.70118738168638         -0.29898921928693
          1.39945538500209          1.68863304325087        -0.316080569352725
          1.39302876013925          1.68291299030356        -0.318811026309737
          1.37862780955764          1.67470040886459        -0.328464035802909
          1.33888932954655           1.6455203324664         -0.35057950495288
          1.34170363278598          1.65125309880412        -0.352106483593704
          1.33409771687105           1.6476312230197        -0.357851333203252
          1.28996019831887          1.61564742554103        -0.383491093704331
          1.27762705285237          1.60820892815713        -0.391853165284879
          1.26374982690537          1.59832611726289        -0.400444308666996
          1.24939709355652          1.59047516560312        -0.411059229283257
          1.22007627988951          1.56767106297978        -0.427440310824417
          1.22439630789787          1.57000264479944        -0.424178911683163
          1.18928889156855          1.54503928694037        -0.446012037426838
          1.19980054154184          1.55026045036837        -0.437171006145828
          1.19872480441535          1.54777656358368        -0.436408960465506
          1.18320984566705           1.5324685580289        -0.442563404755616
          1.19572935249131          1.53853843691236        -0.431963745720778
          1.20383155675482          1.53652587116706        -0.419877778024418
          1.19527378101381          1.52735979573641        -0.422589274811485
          1.20971495685247            1.527632891704         -0.40403106950722
          1.23506733946402          1.53176161065074        -0.374832914642593
          1.29453573217786          1.55493274726869        -0.319498210443368
          1.33606501790039          1.56096923995669        -0.269270554334362
          1.37820879771037          1.56417815512812        -0.214401336426683
          1.42831696419515           1.5583598976453        -0.136335173825386
          1.49290079308294          1.54688849533504       -0.0242854272984895
          1.57307814839628          1.53428188139103         0.124249462525796
          1.60992822701833          1.49363969458038         0.261982649236539
          1.54793119465411          1.40346192227908         0.333876720290798
          1.46770276402727          1.34515483899022         0.303112923123496];
end
f = F(q,:);
                       