public interface Callback{
    //Used to allow for callback functions 
    //didn't have time to implement onReject functions
    
    //not quite sure what to do about the fact that this onSuccess function only takes Ship, and not Projectile
    //make another callback function called bulletCallback?
    void onSuccess(Ship ship); 
    
}
