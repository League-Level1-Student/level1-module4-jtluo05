
public class Vault {
int secretCode;
	Vault(int secretCode){
		this.secretCode=secretCode;
		
	}
	
	
  boolean	tryCode(int guess) {
	  if ( secretCode==guess) {
		return true;
	}
	  else {
		return false;
	}
  }
	
	

}
