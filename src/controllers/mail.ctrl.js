var nodemailer = require("nodemailer");
require ('dotenv').config();
exports.sendEmail = function(req, res){
    // Definimos el transporter
        var transporter = nodemailer.createTransport({
            //service: 'Gmail',
           /* pool: true,
            secure: true,
            host: 'smtp.gmail.com',
            port: 465,
            //ignoreTLS: false,
            //secure: false,
            auth: {               
                user: process.env.EMAIL_ADMIN,
                pass: process.env.PASS_EMAIL_ADMIN                
            }*/
            host: 'smtp.office365.com',
            port: '587',
            auth: { user: process.env.EMAIL_ADMIN, pass: process.env.PASS_EMAIL_ADMIN  },
            secureConnection: false,
            tls: { ciphers: 'SSLv3' }
            
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