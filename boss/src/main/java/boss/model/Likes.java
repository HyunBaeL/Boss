package boss.model;

public class Likes {
	   private int likeId; /* 좋아요 Id */
	   private int fId;/* 자유 게시글 번호 */
	   private String mEmail;/* 이메일 */
	   /*likeDrop : 좋아요 여부는 안씀.*/
	   
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
}
