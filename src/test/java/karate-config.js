function fn(){
    karate.configure('connectTimeout', 5000); //Por si se cae la api no se quede esperando a conectar más de 5 segundos
    karate.configure('readTimeout', 5000); //Por si no lee la respuesta en menos de 5 segundos

    return {
        api: {
            baseUrl: "http://api.geonames.org/"
        },
        endpoint:{
            geoPath: "/timezoneJSON"
        },
        user: {
            name: 'karate'
        }
    };
}