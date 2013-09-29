package org.minig.server.resource.submission;

import org.minig.server.MailMessage;
import org.minig.server.resource.Id;
import org.minig.server.resource.submission.request.SubmissionRequest;
import org.minig.server.service.CompositeId;
import org.minig.server.service.submission.DispositionService;
import org.minig.server.service.submission.SubmissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
// @RequestMapping(value = "1/submission", produces = "application/json")
public class SubmissionResource {

    @Autowired
    private SubmissionService mailSendService;

    @Autowired
    private DispositionService dispositionService;

    @ResponseStatus(value = HttpStatus.CREATED)
    @RequestMapping(value = "", method = RequestMethod.POST)
    public void send(@RequestBody SubmissionRequest request) {
        // TODO
        String replyTo = request.getReplyTo();
        CompositeId id = new CompositeId(replyTo);
        mailSendService.sendMessage(request.getClientMessage(), id);
    }

    @ResponseStatus(value = HttpStatus.CREATED)
    @RequestMapping(value = "forward/**", method = RequestMethod.POST)
    public void forward(@Id CompositeId forwardedMessageId, @RequestBody MailMessage mailMessage) {
        mailSendService.forwardMessage(mailMessage, forwardedMessageId);
    }

    @ResponseStatus(value = HttpStatus.CREATED)
    @RequestMapping(value = "disposition/**", method = RequestMethod.POST)
    public void send(@Id CompositeId id) {
        dispositionService.senDispsoition(id);
    }
}
