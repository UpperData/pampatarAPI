var nodemailer = require("nodemailer");
require ('dotenv').config();
exports.sendEmail = function(req, res){
    // Definimos el transporter
        var transporter = nodemailer.createTransport({
            //service: 'Gmail',
           // pool: true,
           // secure: true,
            host: 'smtp.office365.com',
            port: '587',
            secureConnection: false,
            //ignoreTLS: false,
            //secure: false,
            auth: {               
                user: process.env.EMAIL_ADMIN,
                pass: process.env.PASS_EMAIL_ADMIN                
            },
            tls: { ciphers: 'SSLv3' }
            
            /*host: 'smtp.gmail.com',
            port: 465,
            secure: true,
            auth: {
                type: 'OAuth2',
                user: 'user@example.com',
                accessToken: 'ya29.Xx_XX0xxxxx-xX0X0XxXXxXxXXXxX0x'
            }*/
        });
    // Definimos el email
    var mailOptions = {
        
        from: req.from,
        to: req.to,
        subject: req.subject,
        text: req.text,
        html:req.html
        
    };
    // Enviamos el email
    return transporter.sendMail(mailOptions)
};