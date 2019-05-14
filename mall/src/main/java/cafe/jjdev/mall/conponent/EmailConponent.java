package cafe.jjdev.mall.conponent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import cafe.jjdev.mall.vo.Member;

@Component
public class EmailConponent {
  
	    @Autowired
	    public JavaMailSender emailSender;
	 
	    public void sendSimpleMessage(
	      String to, String subject, Member text) {
	        SimpleMailMessage message = new SimpleMailMessage(); 
	        message.setTo(to); 
	        message.setSubject(subject); 
	        message.setText(text.getMemberPw());
	        System.out.println("아니아니아니!!왜이메일이!!"+text.getMemberPw());
	        emailSender.send(message);
	        System.out.println("왜그러는거야 나한테"+text.getMemberPw());
	        
	    
	}
}
