<%-- 
    Document   : index
    Created on : Nov 2, 2020, 6:16:48 PM
    Author     : jianqing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: 100%;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/WEB-INF/jspf/headtags.jspf" %> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer@1.10.0/dist/APlayer.min.css">
        <script src="https://cdn.jsdelivr.net/npm/aplayer@1.10.0/dist/APlayer.min.js"></script>

        <title>Johnson's Music Box</title>
        <style>
            .aplayer .aplayer-lrc p
            {
                color: #0e90d2 !important; 
            }
            .transparent
            {
                background-color: rgba(255,255,255,0);
                border:0px;
            }

            .btnselected
            {
                border-color: #0e90d2;
                border-width: 1px !important; 
                border-style: solid;
            }

            .hidden
            {
                display: none;
            }

            .afterbody
            {
                background-image: url('https://xeduocdn.sirv.com/Images/conggif3.gif');
                background-size: 100%;
            }
            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
                height:20px;
            }
            .aftertitle
            {
                background-color: rgba(255,255,255,0.6);
            }
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



        </style>
    </head>
    <body id="body" style="height:100%; min-height: 100%;">
        <%@include file="/WEB-INF/jspf/navbar.jspf" %>

        <div class='container'>
            <div id="ttttt">
                <br><br><br><br>


                <h1 id="h1title">Johnson's Music Box</h1>
                <p id="intro">欢迎来到我的歌曲分享站，这里会不定期更新我近期最喜欢的歌</p>

                <br><br>

            </div>

            <div id="aplayer"></div>

            <div class="text-center" id="ctimg">

            </div>

            <div id="recommendation-container">
                <br>
                <hr> 
                <h4>
                    有更多好听的音乐？
                </h4><br>
                <form action="RecommendMusic" method="GET" target="newmusic" accept-charset="utf-8">    
                    <div class="row" >


                        <div class="form-group col-md-5">
                            <label for="rec-music">推荐新音乐:</label>
                            <input placeholder="输入音乐名称" required name="title"  id="rec-music" class="form-control">
                            <small class="form-text text-muted">如有多个，请以逗号分开</small>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="email">联系方式</label>
                            <input type="text" class="form-control" required name="email"  id="email" aria-describedby="emailHelp" placeholder="输入您的联系方式">
                            <small id="emailHelp" class="form-text text-muted">您的联系方式将不会外传</small>
                        </div>
                        <div class="col-md-2">
                            <label for="smbtn"> </label>
                            <div>
                                <button type="submit" class="btn btn-primary" id="smbtn">
                                    提交
                                </button></div>
                        </div>

                    </div>
                </form>

            </div>
            <iframe style=" display: block; border:0px; width: 100%; height: 90px;" id="newmusic" name="newmusic"></iframe>
            <div id="servey-container">
                <br>
                <hr> 
                <h4>
                    喜欢这个网站吗？ <span id="servey-step-1">
                        <button class="transparent" id="likewebbtn" onclick="likeWebsite(true);">
                            <!--yes--> &#9989;
                        </button> <button class="transparent" id="nowebbtn" onclick="likeWebsite(false);">
                            <!--no--> &#10060;
                        </button></span>
                </h4><br>
                <div id="servey-step-2" class="hidden">
                    试一试播放一首歌？<button class="btn btn-primary" onclick="checkPlayin();">
                        OK
                    </button>
                </div>
                <br>
                <div id="servey-step-3" class="hidden">
                    音乐速度加载怎么样？
                    <button class="btn btn-success" onclick="redirectSurprise(1);">
                        好
                    </button>
                    <button class="btn btn-warning" onclick="redirectSurprise(2);">
                        一般
                    </button>
                    <button class="btn btn-danger" onclick="redirectSurprise(3);">
                        不好
                    </button>
                    <div id="lastMsg"></div>
                </div>
            </div>

        </div>
        <script>

            var played = false;



            const ap = new APlayer({
                container: document.getElementById('aplayer'),
                //audio: [],
                mini: false,
                autoplay: false,
                theme: '#ffcccc',
                loop: 'all',
                order: 'random',
                preload: 'auto',
                volume: 0.7,
                mutex: true,
                listFolded: false,
                listMaxHeight: 90,
                lrcType: 3
            });

            ap.on('play', function () {
                played = true;
            });

            (function getFavouriteSongs()
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "GetFaviSongs");
                xhr.send();
                var bbbb;
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4)
                    {
                        if (xhr.status === 200)
                        {
                            var response = xhr.responseText;
                            var responseJson = JSON.parse(response);
                            var code = responseJson.code;
                            if (code === 200)
                            {
                                // ap.list.clear();
                                ap.list.add(responseJson.response);
                            } else
                            {
                                alert("There is an error: " + responseJson.response);
                                ap.list.add({
                                    name: '桃花笑',
                                    artist: '原来是萝卜丫',
                                    url: 'https://file.jianqinggao.com/music/%E5%8E%9F%E6%9D%A5%E6%98%AF%E8%90%9D%E5%8D%9C%E4%B8%AB-%E6%A1%83%E8%8A%B1%E7%AC%91%20%28%E8%B6%85%E7%94%9C%E5%A5%B3%E7%94%9F%E7%89%88%29.mp3',
                                    cover: 'https://y.gtimg.cn/music/photo_new/T002R300x300M000002AChGf1z3evE.jpg',
                                    lrc: 'https://file.jianqinggao.com/music/%E6%A1%83%E8%8A%B1%E7%AC%91%20%28%E8%B6%85%E7%94%9C%E5%A5%B3%E7%94%9F%E7%89%88%29-%E5%8E%9F%E6%9D%A5%E6%98%AF%E8%90%9D%E5%8D%9C%E4%B8%AB.lrc',
                                    theme: '#ffcccc'
                                });
                            }

                        } else
                        {
                            alert("There is an error, status code" + xhr.status);

                        }
                    }
                };

            })();


            //getFavouriteSongs();
            function getRandomColor() {
                var letters = '0123456789ABCDEF';
                var color = '#';
                for (var i = 0; i < 6; i++) {
                    color += letters[Math.floor(Math.random() * 16)];
                }
                return color;
            }
            function likeWebsite(flag)
            {

                document.getElementById(flag ? "likewebbtn" : "nowebbtn").classList.add("btnselected");
                document.getElementById(flag ? "nowebbtn" : "likewebbtn").classList.remove("btnselected");
                document.getElementById("servey-step-1").classList.add("hidden");
                document.getElementById("servey-step-2").classList.remove("hidden");
            }

            function checkPlayin()
            {
                if (played)
                {
                    document.getElementById("servey-step-2").classList.add("hidden");
                    document.getElementById("servey-step-3").classList.remove('hidden');
                } else
                {
                    alert("请先调整电脑音量，播放歌曲");
                    ap.play();
                    played = true;
                    checkPlayin();
                }
            }

            function loadSurprise()
            {
                const newtitle = "祝Ella生日快乐！！";
                const newIntro = "生活快乐天天开心哦！";
                const bgUrl = "https://64.media.tumblr.com/c906d30d3cb3c62fcf7346e4b59b6618/tumblr_ozkt0mAgt61rrq1zoo1_400.gifv";//"https://xeduocdn.sirv.com/Images/conggif3.gif";
                //adjust player
                ap.setMode("mini");
                ap.list.add([{
                        name: '生日快乐',
                        artist: '生日快乐噢~',
                        url: 'https://file.jianqinggao.com/music/happybday.mp3',
                        cover: 'https://xeduocdn.sirv.com/Images/hbdcupcake.jpg',
                        lrc: 'https://file.jianqinggao.com/music/%E7%A5%9D%E4%BD%A0%E7%94%9F%E6%97%A5%E5%BF%AB%E4%B9%90-%E5%AE%9D%E5%AE%9D%E5%B7%B4%E5%A3%AB.lrc',
                        theme: '#66ffff'
                    }]);
                //hide servey
                document.getElementById("recommendation-container").classList.add("hidden");
                document.getElementById("servey-container").classList.add("hidden");

                //change title
                document.getElementById("h1title").innerHTML = newtitle;
                document.getElementById("ttttt").classList.add("aftertitle");
                document.getElementById("intro").innerHTML = newIntro;

                //change background
                document.getElementById("body").classList.add("afterbody");

                document.getElementById("ttttt").classList.add("text-center");
                document.getElementById("aplayer").classList.add("afterplayer");
                ap.list.switch(ap.list.audios.length - 1);
                ap.options.loop = 'one';
                ap.play();

                //start randomizing the color of title
                var x = setInterval(function () {
                    document.getElementById("h1title").style.setProperty("color", getRandomColor());
                }, 1500);

                var centralImage = document.createElement("img");
                centralImage.src = "https://xeduocdn.sirv.com/Images/6b3fe963030867.5aa3707f0c627.gif";

                document.getElementById("ctimg").appendChild(centralImage);
            }

            function redirectSurprise(f)
            {
                try {
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "WebsiteFeedback?feedback=" + f);
                    xhr.send();
                } catch (e) {
                    console.error(e);
                }
                
                document.getElementById("lastMsg").innerHTML = "感谢您的反馈，祝您生活愉快！即将帮您关灯(5)";
                var counter = 5;
                var y = setInterval(function () {
                    if (counter > 0)
                    {
                        counter--;
                        document.getElementById("lastMsg").innerHTML = "感谢您的反馈，祝您生活愉快！(" + counter + ")";
                    } else
                    {
                        window.location.href = "bday";
                    }

                }, 1000);
            }



        </script>

        <br><br><br>
        <!--<footer class="text-center footer" >
            <hr>

            Made by Jianqing Gao
            <br><br><br>
        </footer>-->
    </body>
</html>
