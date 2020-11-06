<%-- 
    Document   : bday
    Created on : Nov 5, 2020, 12:37:05 PM
    Author     : jianqing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/WEB-INF/jspf/headtags.jspf" %>
        <meta name="description" content="Happy Birthday">
        <meta name="robots" content="index, follow" />
        <!--<link rel="author" href="https://plus.google.com/u/1/+AyushSharma1/" /> -->
        <meta name="keywords" content="Birthday, Happy">
        <!-- Strat of Facebook Meta -->
        <meta property="og:type" content="E-Greeting" />
        <meta property="og:image" content="favicon.ico" />
        <meta property="og:description" content="Wish you a very Happy Birthday">
        <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="stylesheet" type="text/css" href="loading.css">
        <link href='http://fonts.googleapis.com/css?family=Signika' rel='stylesheet' type='text/css'>
        <link rel="stylesheet/less" href="cake.less">
        <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.1.0/less.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer@1.10.0/dist/APlayer.min.css">
        <script src="https://cdn.jsdelivr.net/npm/aplayer@1.10.0/dist/APlayer.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <style>
            .afterplayer
            {
                /*border-width: 3px;
                background-color: #cae8ca;
                border-style: solid;*/
                position: fixed;
                padding: 7px;
                bottom: 0;
                right: 0;
                max-width: 450px;
                z-index: 999;
            }
            .afternav
            {
                background-color: #f9b47a;
                color:#ff66ff;
            }
            
            .afternav a span, .afternav a
            {
               color: #e008e0;
            }
        </style>
        
        <title>Happy Birthday</title>
    </head>
    
    <body style='background-color:black;'>
        <%@include file="/WEB-INF/jspf/navbar.jspf" %>
        <div class="loading"></div>

        <div class="balloons text-center" id="b1">
            <h2 style="color:#F2B300;">H</h2>
        </div>
        <div class="balloons text-center" id="b2">
            <h2 style="color:#0719D4;">B</h2>
        </div>
        <div class="balloons text-center" id="b3">
            <h2 style="color:#D14D39;">D</h2>
        </div>
        <!--Customize-->
        <div class="balloons text-center" id="b4">
            <h2 style="color:#8FAD00;">E</h2>
        </div>
        <div class="balloons text-center" id="b5">
            <h2 style="color:#8377E4;">L</h2>
        </div>
        <div class="balloons text-center" id="b6">
            <h2 style="color:#99C96A;">L</h2>
        </div>
        <div class="balloons text-center" id="b7">
            <h2 style="color:#20CFB4;">A</h2>
        </div>

        <img src="Balloon-Border.png" style='width:100%;' class="balloon-border" alt=''>


        <div class="container">

            <div class="row">
                <div class="col-md-2 col-xs-2 bulb-holder">
                    <div class="bulb" id="bulb_yellow"></div>
                </div>
                <div class="col-md-2 col-xs-2 bulb-holder">
                    <div class="bulb" id="bulb_red"></div>
                </div>
                <div class="col-md-2 col-xs-2 bulb-holder">
                    <div class="bulb" id="bulb_blue"></div>
                </div>
                <div class="col-md-2 col-xs-2 bulb-holder">
                    <div class="bulb" id="bulb_green"></div>
                </div>
                <div class="col-md-2 col-xs-2 bulb-holder">
                    <div class="bulb" id="bulb_pink"></div>
                </div>
                <div class="col-md-2 col-xs-2 bulb-holder">
                    <div class="bulb" id="bulb_orange"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <img src="banner.png" class="bannar">
                </div>
            </div>
            <div class="row cake-cover">
                <div class="col-md-12 texr-center">
                    <div class="cake">
                        <div class="velas">
                            <div class="fuego"></div>
                            <div class="fuego"></div>
                            <div class="fuego"></div>
                            <div class="fuego"></div>
                            <div class="fuego"></div>
                        </div>
                        <div class="cobertura"></div>
                        <div class="bizcocho"></div>
                    </div>
                </div>
            </div>
            <div class="row message">
                <div class="col-md-12">
                    <p>Today is...</p>
                    <p>as beautiful as other days</p>
                    <p>but you realize</p>
                    <p>another year has gone</p>
                    <p>in a blink of the eyes</p>
                    <p><strong>however</strong></p>
                    <p>Do you know..?</p>
                    <p>today is just special</p>
                    <p>so special to you</p>
                    <p>that's why</p>
                    <p>Let's make it...</p>
                    <p>the best celebration ever</p>
                    <p>and let me share...</p>
                    <p>a piece of happiness to you</p>
                    <p>I made all this...</p>
                    <p>as a birthday present to you</p>
                    <p>thanks for being there</p>
                    <p>thanks for the friendship we made</p>
                    <p>thanks for everything</p>
                    <p>I wish you all the best</p>
                    <p>May your life be at ease</p>
                    <p>May all your wishes come true</p>
                    <p>Remember</p>
                    <p>your ambitions</p>
                    <p>you live as a free bird...</p>
                    <p>flying in the blue sky</p>
                    <p>Now things are different...</p>
                    <p>real story of your life</p>
                    <p>is just about to begin</p>
                    <p>indeed..</p>
                    <p>but...</p>
                    <p>don't worry</p>
                    <p>because...</p>
                    <p>God has your back</p>
                    <p>and</p>
                    <p>this year will be better</p>
                    <p>and I hope</p>
                    <p>you'll find...</p>
                    <p>happiness along the way</p>
                    <p>keep your spirit up</p>
                    <p>enjoy every single moment...</p>
                    <p>that you experience today</p>
                    <p>fill it with your most beautiful smile</p>
                    <p>and make it the best memory..</p>
                    <p>lastly...</p>
                    <p>I'd like to wish you one more time</p>
                    <p>a very happy birthday Ella Xu</p><!--Customize-->
                </div>
            </div>
            <div class="navbar navbar-fixed-bottom">
                <div class="row">
                    <div class="col-md-6 text-center col-md-offset-3">
                        <button class="btn btn-primary" id="turn_on">Turn On Lights</button>
                        <button class="btn btn-primary" id="play">Play Music</button>
                        <button class="btn btn-primary" id="bannar_coming">Let's Decorate</button>
                        <button class="btn btn-primary" id="balloons_flying">Fly With Balloons</button>
                        <button class="btn btn-primary" id="cake_fadein">Most Delicious Cake Ever</button>
                        <button class="btn btn-primary" id="light_candle"> Light Candle</button>
                        <button class="btn btn-primary" id="wish_message">Happy Birthday</button>
                        <button class="btn btn-primary" id="story">A message for you</button>
                        <button class="btn btn-primary" id="replay">Replay</button>
                        <!-- <button class="btn btn-primary" id="cake_cut">Lrt's Cut the Cake</button> -->
                    <div id='aplayer' class='aplayer afterplayer' style='display:none;'></div>
                    </div>
                </div>
                <!-- <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div> -->
            </div>


        </div>
        
        
    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap3.min.js"></script>
    <script>
         const ap = new APlayer({
                container: document.getElementById('aplayer'),
                audio: [{
                        name: '生日快乐2',
                        artist: '生日快乐噢2~',
                        url: 'https://s-bj-1972-xeduo.oss.dogecdn.com/music/hbd.mp3',
                        cover: 'https://xeduocdn.sirv.com/Images/hbdcupcake.jpg',
                        //lrc: 'https://file.jianqinggao.com/music/%E7%A5%9D%E4%BD%A0%E7%94%9F%E6%97%A5%E5%BF%AB%E4%B9%90-%E5%AE%9D%E5%AE%9D%E5%B7%B4%E5%A3%AB.lrc',
                        theme: '#66ffff'
                    }/*,{
                        name: '生日快乐',
                        artist: '生日快乐噢~',
                        url: 'https://file.jianqinggao.com/music/happybday.mp3',
                        cover: 'https://xeduocdn.sirv.com/Images/hbdcupcake.jpg',
                        lrc: 'https://file.jianqinggao.com/music/%E7%A5%9D%E4%BD%A0%E7%94%9F%E6%97%A5%E5%BF%AB%E4%B9%90-%E5%AE%9D%E5%AE%9D%E5%B7%B4%E5%A3%AB.lrc',
                        theme: '#66ffff'
                    }*/
                ],
                mini: true,
                autoplay: false,
                theme: '#ffcccc',
                loop: 'all',
               // order: 'random',
                preload: 'auto',
                volume: 0.7,
                mutex: true,
                listFolded: false,
                listMaxHeight: 90,
                lrcType: 3
            });
    </script>
    
    <script src="js/effect.js"></script>
</html>
