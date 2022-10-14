function fn() {

    var config = {
        cabBaseUrl: 'http://cab',
        adQueryServiceBaseUrl:"http://ad-query-service.qa.dev.ki.ecg.so",
        catalyst_authUsername: 'catalyst',
        catalyst_authPassword: 1234,
        cab_authUsername:'driver',
        cab_authPassword: 1234,
        abc_authUsername: 'abc',
        abc_authPassword: 1234
    };

    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);
    karate.configure('ssl',true);
    //karate.configure('proxy','http://proxy:3128');


    return config;
}
