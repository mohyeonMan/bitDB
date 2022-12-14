package board.bean;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class BoardDTO {
	private int seq;
    private String id;
    private String name;
    private String email;
    private String subject;
    private String content; 

    private int ref;
    private int lev;
    private int step;
    private int pseq;
    private int reply;

    private int hit;
    private String logtime;
}
