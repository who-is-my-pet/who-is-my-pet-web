package counter;

public class Counter {
	private static int count;  //페이지 접근한 횟수
	
	public static synchronized int getCount() {
		count++;
		return count; 
	}

}
