package guestbook.bean;

public class GuestbookDTO {
private int seq;
private	String	name,
				email,
				homepage,
				subject,
				content,
				logtime;
public GuestbookDTO(String name, String email, String homepage, String subject, String content) {
	this.name = name;
	this.email = email;
	this.homepage = homepage;
	this.subject = subject;
	this.content = content;
}

public GuestbookDTO(int seq, String name, String email, String homepage, String subject, String content, String date) {
	this.seq = seq;
	this.name = name;
	this.email = email;
	this.homepage = homepage;
	this.subject = subject;
	this.content = content;
	this.logtime = date;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getHomepage() {
	return homepage;
}

public void setHomepage(String homepage) {
	this.homepage = homepage;
}

public String getSubject() {
	return subject;
}

public void setSubject(String subject) {
	this.subject = subject;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public int getSeq() {
	return seq;
}

public void setSeq(int seq) {
	this.seq = seq;
}

public String getLogtime() {
	return logtime;
}

public void setLogtime(String date) {
	this.logtime = date;
}


}
