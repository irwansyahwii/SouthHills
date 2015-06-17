'use strict';

var app = angular.module("buzzbuddies", ['ngRoute','ngCookies', 'ngTouch', 'ui.bootstrap', 'ngAnimate', 'ngDialog', 'pascalprecht.translate', 'ngSanitize','ngImgCrop', 'slick' ,'mb-scrollbar','reCAPTCHA','monospaced.elastic', 'duScroll', 'yaru22.angular-timeago', 'masonry']);

    app.config(function($routeProvider, $controllerProvider, $locationProvider, $httpProvider,reCAPTCHAProvider) {
            // required: please use your own key :)
            reCAPTCHAProvider.setPublicKey('6LdmIggTAAAAAGXhFaLaQ-sIDjgTHeM3VydZxFIf');

            // optional: gets passed into the Recaptcha.create call
            reCAPTCHAProvider.setOptions({
                theme: 'clean'
            });

            $routeProvider.
                when('/', {
                    title : 'Home',
                    templateUrl: 'homepage.php',
                    controller: 'homeCtrl',
                    async:true
                }).
                when('/post/:usr_id?/:post_uid?', {
                    title : 'Post',
                    templateUrl: 'post.php',
                    controller: 'postCtrl',
                    async:true
                }).
                when('/postout/:usr_id?/:post_uid?', {
                    title : 'Post',
                    templateUrl: 'postout.php',
                    controller: 'postoutCtrl',
                    async:true
                }).
                when('/profile/:username', {
                    title : 'Profile',
                    templateUrl: 'profile.php',
                    controller: 'profileCtrl'
                }).
                when('/about/:username', {
                    title: 'About Me',
                    templateUrl: 'profile_about_me.php',
                    controller: 'aboutCtrl'
                }).
                when('/photo-album/:username', {
                    title: 'Photo Album',
                    templateUrl: 'profile_photo_album.php',
                    controller: 'albumCtrl'
                }).
                when('/setting', {
                    title : 'General Setting',
                    templateUrl: 'setting.php',
                    controller: 'settingCtrl'
                }).
                when('/setting-privacy', {
                    title: 'Privacy Setting',
                    templateUrl: 'setting_privacy.php',
                    controller: 'settingCtrl'
                }).
                when('/privacy', {
                    title : 'Privacy',
                    templateUrl: 'privacy.php'
                }).
                when('/terms', {
                    title : 'Terms',
                    templateUrl: 'terms.php'
                }).
                when('/cookies', {
                    title : 'Cookies',
                    templateUrl: 'cookies.php'
                }).
                when('/rules', {
                    title : 'Rules',
                    templateUrl: 'rules.php'
                }).
                when('/tag/status/:keyword', {
                    title: 'Search Result',
                    templateUrl: 'search_result_hashtag.php',
                    controller: 'hashtagCtrl'
                }).
                when('/tag/photo/:keyword', {
                    title: 'Search Result',
                    templateUrl: 'search_result_hashtag_ph.php',
                    controller: 'hashtagCtrl'
                }).
                when('/tag/polling/:keyword', {
                    title: 'Search Result',
                    templateUrl: 'search_result_hashtag_pl.php',
                    controller: 'hashtagCtrl'
                }).
                when('/signup/:invite_userid?/:invite_uid?/:invitation_code?', {
                    title : 'Signup',
                    templateUrl: 'signup.php'
                }).
                when('/signedup', {
                    title : 'Signedup',
                    templateUrl: 'signedup.php',
                    controller: 'signedCtrl'
                }).
                when('/search/:keyword', {
                    title : 'Search',
                    templateUrl: 'search_result.php',
                    controller: 'homeCtrl'
                }).
                when('/notification', {
                    title : 'Notification',
                    templateUrl: 'notificationpage.php',
                    controller: 'notifCtrl'
                }).
                when('/forgot_password', {
                    title: 'Forgot Password',
                    templateUrl: 'forgot_password.php',
                    controller: 'forgotpassCtrl'
                }).
                when('/reset_password/:keycode', {
                    title: 'Reset Password',
                    templateUrl: 'reset_password.php',
                    controller: 'resetpassCtrl'
                }).                
                when('/friend/:username/overview', {
                    title: 'Friends',
                    templateUrl: 'friends.php',
                    controller: 'friendCtrl'
                }).
                when('/friend/:username/block', {
                    title: 'Blocked Friends',
                    templateUrl: 'friends_block.php',
                    controller: 'friendCtrl'
                }).
                when('/friend/:username/circle', {
                    title: 'Circle',
                    templateUrl: 'friends_circle.php',
                    controller: 'friendCtrl'
                }).
                when('/friend/:username/search', {
                    title: 'Find Friends',
                    templateUrl: 'friends_find.php',
                    controller: 'friendCtrl'
                }).
                when('/login', {
                    title : 'Login',
                    templateUrl: 'login_v2.php',
                    controller:'loginCtrl'
                }).
                when('/reg_verification/:verification_code?/:invite_userid?/:invite_uid?/:invitation_code?', {
                    title : 'Verify',
                    templateUrl: 'verify.php',
                    controller:'verifyCtrl'
                }). 
                when('/verify', {
                    title : 'Verify',
                    templateUrl: 'verifypage.php',
                    controller:'verifypageCtrl'
                }).                
                when('/accept_friend/:invite_userid?/:invite_uid?/:invitation_code?', {
                    title : 'Accept Friend',
                    templateUrl: 'accept_friend.php',
                    controller:'accfriendCtrl'
                }).
                when('/404', {
                    title : 'Page Not Found',
                    templateUrl : '404.php'                   
                }).
                otherwise({
                    redirectTo : '/404'
                });                
            $locationProvider.html5Mode(true); 
        });
app.run(['$rootScope', '$route', '$location', 'loginService','constant','$templateCache','getService', '$routeParams', '$cookieStore', function($rootScope, $route, $location, loginService, constant, $templateCache, getService, $routeParams, $cookieStore) {
    // $rootScope.init_profile_data;
    $rootScope.config_url = $global_site_path; 
    $rootScope.$on('$routeChangeSuccess', function(newVal, oldVal) {
        var routesPermission = ['/', '/profile/:username'];
        if (oldVal !== newVal) {
            document.title = "Buzzbuddies :: "+$route.current.title;
        }

        // console.log($scope)
    });


        /*****************************
         *  FUNCTION FOR AUTHENTIFICATION PURPOSE
         *  cek ketersediaan cookies dan routes permission
         *  author : fakhri
         *****************************/
    $rootScope.$on('$routeChangeStart', function(event, next, current){
        var username_profile = next.params.username;
        var routesPermission = ['/', '/profile','/signup','/forgot_password','/reset_password','/reg_verification','/accept_friend','/privacy','/terms','/cookies','/rules','/postout','/post'];
        var routesPermissionFriend = ['/friend/'+username_profile+'/circle', '/friend/'+username_profile+'/block', '/friend/'+username_profile+'/search'];
        var haveAuthentification = loginService.isLogged();        
        var access_token = $cookieStore.get('access_token');
        if(haveAuthentification == false && routesPermission.indexOf($location.path()) >= -1 && routesPermission.indexOf($location.path()) != 2 && routesPermission.indexOf($location.path().substr(0,7)) != 2 && routesPermission.indexOf($location.path($location.path().substr(0,15))) != 3 && routesPermission.indexOf($location.path().substr(0,15)) != 4 && routesPermission.indexOf($location.path().substr(0,17)) != 5 && routesPermission.indexOf($location.path().substr(0,14)) != 6 && routesPermission.indexOf($location.path()) != 7 && routesPermission.indexOf($location.path()) != 8 && routesPermission.indexOf($location.path()) != 9 && routesPermission.indexOf($location.path()) != 10 && routesPermission.indexOf($location.path().substr(0,8)) != 11 && routesPermission.indexOf($location.path().substr(0,5)) != 12){
                    if(next.templateUrl == '/login'){
                        event.preventDefault();                 
                    }
                    else{                        
                        $location.path('/login');        
                    }
        }
        else
        {
            if(access_token!= null){
                getService.checkVerify(access_token).
                success(function(response){
                    if(haveAuthentification == false && routesPermission.indexOf($location.path()) >= -1 && routesPermission.indexOf($location.path()) != 2 && routesPermission.indexOf($location.path()) != 3 && routesPermission.indexOf($location.path().substr(0,15)) != 4 && routesPermission.indexOf($location.path().substr(0,17)) != 5 && routesPermission.indexOf($location.path().substr(0,14)) != 6 && routesPermission.indexOf($location.path()) != 7 && routesPermission.indexOf($location.path()) != 8 && routesPermission.indexOf($location.path()) != 9 && routesPermission.indexOf($location.path()) != 10 && routesPermission.indexOf($location.path().substr(0,8)) != 11 && routesPermission.indexOf($location.path().substr(0,5)) != 12){
                            if(next.templateUrl == '/login'){
                                event.preventDefault();                 
                            }
                        } 
                })
                .error(function(){
                    if(access_token != undefined){
                        $location.path('/verify');
                    }
                });
            }
        } 
        

        var access_token = $cookieStore.get('access_token')
        // if(access_token)
        if(access_token != undefined){
            getService.getIdentification().success(function(result){
                var username_user = result.username;            
                if(haveAuthentification == true && routesPermissionFriend.indexOf($location.path()) >= 0 && username_profile != username_user){                    
                    $location.path('/friend/'+username_profile+'/overview');
                }

            })  
        }
              
          
    });
}]);

app.filter('buzzHash',['$filter', '$sce', 'ngDialog',
    function($filter, $sce, ngDialog) {
        return function(text, target) {
            if (!text) return text;
 
            var replacedText = $filter('linky')(text, target);
            var targetAttr = "";
            if (angular.isDefined(target)) {
                targetAttr = ' target="' + target + '"';
            }
            // replace #hashtags and send them to twitter
            var replacePattern1 = /(^|\s)#(\w*[a-zA-Z_]+\w*)/gim;
            replacedText = text.replace(replacePattern1, '$1<a class="anchor" href="'+$global_site_path+'tag/status/$2" target="_self">#$2</a>');
            
            return $sce.trustAsHtml(replacedText);
        };
    }
]);

app.filter('startsWithTag', [function($scope) {
    return function(array, search) {
        var matches = [];
        for(var i = 0; i < Object.keys(array).length; i++) {
            if (angular.lowercase(array[i].username).indexOf(angular.lowercase(search)) === 0) {
                matches.push(array[i]);                                    
            }
        }
        return matches.slice(0,5);
    };
}]);


/* ========================================================
 * Filter untuk mendapatkan jumlah data comment, ketika action delete
 * Author : Fakhri
 * ========================================================*/
app.filter('initOpenedComment', [function($scope){
    return function(data){                
        return $scope.opened_comment;
    }
}]);

/* ========================================================
 * Filter untuk mengubah text link menjadi anchor element
 * Author : Fakhri
 * ========================================================*/
app.filter('convertLink', [function($scope){
    return function(data){
        var exp = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim;
        data = data.replace(exp, "<a href='$1' target='_blank'>$1</a>");
        return data;
    }
}]);
/* ========================================================
 * Filter untuk mengubah tag [tag:username;username=exampleUser;fullname=Example User][/url]
 * Author : Fakhri
 * ========================================================*/
app.filter('convertTag', [function($scope){
    return function(data){
        var exp = /(\[tag(.+?))/g;        
        if(exp.exec(data) != null){
            data=data.replace(/\[tag\:(.+?);name=(.+?)\]/g, '<a href="'+ $global_site_path + 'profile/$1" class="hashtag">$2</a>');    
        }        
        return data
    }
}]);

/* ========================================================
 * Filter untuk mengubah tag [tag:username;username=exampleUser;fullname=Example User][/url]
 * Author : Fakhri
 * ========================================================*/
app.filter('convertTagNotif', [function($scope){
    return function(data){
        var exp = /(\[tag(.+?))/g;        
        if(exp.exec(data) != null){
            data=data.replace(/\[tag\:(.+?);name=(.+?)\]/g, '$2');    
        }        
        return data
    }
}]);

app.filter('convertSticker',[function(){
    return function(data, $scope){
        data=data.replace(/\[sticker\:(.+?)\/(.+?)\]/g, function($1, $2, $3){
            
            if($2 == 'jempol'){
                return '<div class="sticker" style="background-image:url(http://localhost/buzzbuddies_v2/Buzz_Front/assets/img/main/sticker/jempolan/'+$3+');display:block"></div>'
            }else if($2 == 'buzz'){
                return '<div class="sticker" style="background-image:url(http://localhost/buzzbuddies_v2/Buzz_Front/assets/img/main/sticker/buzzbuddies/'+$3+');display:block"></div>'
            }else{
                return '<div class="sticker" style="background-image:url("http://localhost/buzzbuddies_v2/Buzz_Front/assets/img/main/sticker/monkey/'+$3+');display:block"></div>'
            }
        })
        
        return data;
    }

}])

/* ========================================================
 * Filter untuk mengubah tag [url=http://example.com][/url]
 * Author : Fakhri
 * ========================================================*/
app.filter('convertAnchor', [function($scope){
    return function(data){
        data = data.replace(/\[url\=(.+?)\]\[\/url\]/g, '<a href="$1">$1</a>');
        return data
    }
}]);

/* ========================================================
 * Filter untuk search tagging friend berdasarkan huruf pertama
 * Author : Fakhri
 * ========================================================*/
app.filter('filterNameTag', [function($scope){
   return function(array, search) {
        var matches = [];
        for(var i = 0; i < Object.keys(array).length; i++) {
            if (angular.lowercase(array[i].username).indexOf(angular.lowercase(search)) === 0) {
                matches.push(array[i]);
            }
        }
        return matches;
    };
}]);

app.filter('convertDateTime', [function($scope){
    return function(data){
        var dateParts = data.split(' '),
        timeParts = dateParts[1].split(':'),
        date;

        dateParts = dateParts[0].split('-');

        date = new Date(dateParts[0],parseInt(dateParts[1], 10) - 1, dateParts[2], timeParts[0], timeParts[1]);

        return date.getTime();
    }
}]);

app.filter('toTrusted', ['$sce', function($sce, $scope){
    return function(data){        
        console.log(data)
        return data;    
    }
}]);

app.filter('unsafe', ['$sce', function ($sce) {
    return function (val) {
        return $sce.trustAsHtml(val);
    };
}]);

app.filter('newLine',[function($scope){
    return function(data){        
        data=data.replace(new RegExp('\r?\n','g'), '<br/>');
        return data
    }
}]);


/* ================================
 * FUNCTION FILTER FOR COMMENT DATE TIME
 * View on template_comment.php
 * author : fakhri
 * ================================*/

app.filter('convertUTC', [function($scope,$timeout, $filter){
    return function(date) {        
        var newDate = new Date(date);
        
        var seconds = Math.floor((new Date() - new Date(date)) / 1000);
        
        var interval = Math.floor(seconds / 31536000);

        if (interval >= 1) {
            return parseInt(interval) + " Years";
        }
        interval = Math.floor(seconds / 2592000);
        if (interval >= 1) {
            return parseInt(interval) + " Months";
        }
        interval = Math.floor(seconds / 86400);
        if (interval >= 1) {
            return parseInt(interval) + " Days";
        }
        interval = Math.floor(seconds / 3600);
        if (interval >= 1) {
            return parseInt(interval) + " Hours ";
        }
        interval = Math.floor(seconds / 60);
        if (interval >= 1) {
            return parseInt(interval) + " Minutes";
        }
            return parseInt(Math.floor(seconds)) + " Seconds";
    }  
}]);

/* ================================
 * FUNCTION FILTER FOR getInterval
 * 
 * author : arfan
 * ================================*/

app.filter('getInterval', [ function($scope){
    return function(date){        
        var dateParts = date.split("-");
        
        var seconds = Math.round(((new Date() - new Date(dateParts)) / 1000)-25200);
        var interval = Math.round(seconds / 31536000);

        if (interval >= 1) {
            return parseInt(interval) + " Years";
        }
        interval = Math.round(seconds / 2592000);
        if (interval >= 1) {
            return parseInt(interval) + " Months";
        }
        interval = Math.round(seconds / 86400);
        if (interval >= 1) {
            return parseInt(interval) + " Days";
        }
        interval = Math.round(seconds / 3600);
        if (interval >= 1) {
            return parseInt(interval) + " Hours ";
        }
        interval = Math.floor(seconds / 60);
        if (interval >= 1) {
            return parseInt(interval) + " Minutes";
        }
            return parseInt(Math.round(seconds)) + " Seconds";
    }  
}]);

app.filter('convertDateISO',[function($scope){
    return function(data){        
        var dateISO = data.replace(' ', 'T');
        return dateISO
    }
}])

app.filter('convertTimezone',[function($scope){
    return function(data){        
        var date = new Date(data);
        if((date.getTimezoneOffset() * 60000)<0){
            var utc = date.getTime() - (date.getTimezoneOffset() * 60000);
        }
        else
        {
            var utc = date.getTime() + (date.getTimezoneOffset() * 60000);
        }

        utc = new Date(utc);
        var date2 = new Date(Date.parse(utc)).toUTCString();
        date2 = date2.replace(':00 GMT','');
        return date2;
    }
}])

