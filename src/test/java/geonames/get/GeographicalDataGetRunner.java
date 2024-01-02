package geonames.get;

import com.intuit.karate.junit5.Karate;

public class GeographicalDataGetRunner {
    @Karate.Test
    Karate userGet(){
        return Karate.run().relativeTo(getClass()); //ejecuta todos los features del package
        //return Karate.run("user-get").relativeTo(getClass()); //ejecuta solo el feature indicado
    }
}
