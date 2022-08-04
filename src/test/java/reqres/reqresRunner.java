package reqres;

import com.intuit.karate.junit5.Karate;

class reqresRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("GET").relativeTo(getClass());
    }    

}
