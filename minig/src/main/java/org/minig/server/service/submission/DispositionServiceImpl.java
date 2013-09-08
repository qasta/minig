package org.minig.server.service.submission;

import java.text.MessageFormat;

import javax.mail.Message.RecipientType;
import javax.mail.internet.MimeMessage;

import org.minig.server.service.CompositeId;
import org.minig.server.service.MailRepository;
import org.minig.server.service.impl.MailContext;
import org.minig.server.service.impl.helper.MessageMapper;
import org.minig.server.service.impl.helper.mime.Mime4jMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sun.mail.dsn.DeliveryStatus;
import com.sun.mail.dsn.MultipartReport;

@Component
class DispositionServiceImpl implements DispositionService {

    // TODO
    private static final String s = "This is a Return Receipt for the mail that you sent to {0}. \r\n\r\n"
            + "Note: This Return Receipt only acknowledges that the message was displayed on the recipient's computer. There is no guarantee that the recipient has read or understood the message contents.";

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private MailRepository mailRepository;

    @Autowired
    private MailContext mailContext;

    @Autowired
    private Submission submission;

    @Override
    public void senDispsoition(CompositeId id) {
        Mime4jMessage message = mailRepository.read(id.getFolder(), id.getMessageId());

        if (message != null) {
            MimeMessage mimeMessage = messageMapper.toMimeMessage(message);

            try {
                MimeMessage msg = new MimeMessage(mailContext.getSession());
                String format = MessageFormat.format(s, mimeMessage.getFrom()[0].toString());

                MultipartReport multipart = new MultipartReport(format, new DeliveryStatus(), mimeMessage);
                msg.setContent(multipart);
                msg.setSubject("Return Receipt (displayed) - " + mimeMessage.getSubject());
                msg.setRecipient(RecipientType.TO, mimeMessage.getFrom()[0]);

                submission.submit(msg);
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage(), e);
            }
        }
    }

}