function fn() {

    var config = {
        cabBaseUrl: 'http://cab',
        adQueryServiceBaseUrl:"http://ad-query-service.qa.dev.ki.ecg.so",
        catalyst_authUsername: 'catalyst',
        catalyst_authPassword: ****,
        cab_authUsername:'driver',
        cab_authPassword: ****,
        abc_authUsername: 'abc',
        abc_authPassword: ****
    };

    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);
    karate.configure('ssl',true);
    //karate.configure('proxy','http://proxy:3128');


    return config;
}
