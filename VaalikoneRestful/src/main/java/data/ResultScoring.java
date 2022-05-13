package data;
/**
 * Score object
 *
 */
public class ResultScoring implements java.lang.Comparable<ResultScoring>{
	private int id;
	private int TotalPoints;
	
	public int score (int userAnswer, int canditateAnswer) {
		int sameAnswer = 2;
		int oneOff = 1;
		int differentAnswer = 0;

		if(userAnswer == canditateAnswer){
			return sameAnswer;
		}
		if(userAnswer-canditateAnswer == 1 || userAnswer-canditateAnswer == -1){
			return oneOff;
		}
		return differentAnswer;
	}
public ResultScoring(int id, int TotalPoints) {
	this.id=id;
	this.TotalPoints=TotalPoints;
	}
	
	public ResultScoring() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotalPoints() {
		return TotalPoints;
	}

	public void setTotalPoints(int totalPoints) {
		TotalPoints = totalPoints;
	}
	
	public int compareTo(ResultScoring comparestu) {
        int compareTotalPoints=((ResultScoring)comparestu).getTotalPoints();
       // For Descending order do like this
        return compareTotalPoints-this.TotalPoints;

        // For Ascending order
        //return this.TotalPoints-compareTotalPoints;
    }
	
	
}
