const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: process.env.GMAIL_USER, // your Gmail address
        pass: process.env.GMAIL_APP_PASS, // Gmail App Password (16-char, no spaces)
    },
});

// ── Verify connection on startup ─────────────────────────────────
transporter.verify((err) => {
    if (err) console.error("[Mailer] Connection failed:", err.message);
    else console.log("[Mailer] Ready to send emails");
});

// ── Send email verification ───────────────────────────────────────
const sendVerificationEmail = async (toEmail, username, token) => {
    const link = `${process.env.CLIENT_URL}/verify-email?token=${token}`;

    await transporter.sendMail({
        from: `"RailManager" <${process.env.GMAIL_USER}>`,
        to: toEmail,
        subject: "Verify your RailManager email address",
        html: `
        <div style="font-family:Arial,sans-serif;max-width:520px;margin:0 auto;background:#f6f7f9;border-radius:12px;overflow:hidden">
            <div style="background:linear-gradient(135deg,#072649,#0054a0);padding:2rem;text-align:center">
            <h1 style="color:white;margin:0;font-size:1.5rem">RailManager</h1>
            <p style="color:#7cc4fb;margin:0.5rem 0 0;font-size:0.85rem">Train Management System</p>
            </div>
            <div style="padding:2rem">
            <h2 style="color:#0a3c6d;margin-top:0">Hi ${username} 👋</h2>
            <p style="color:#444;line-height:1.7">
                Thanks for registering! Please verify your email address by clicking the button below.
                This link expires in <strong>24 hours</strong>.
            </p>
            <div style="text-align:center;margin:2rem 0">
                <a href="${link}"
                style="background:linear-gradient(135deg,#0054a0,#0c87e8);color:white;padding:14px 32px;border-radius:10px;text-decoration:none;font-weight:600;font-size:1rem;display:inline-block">
                Verify Email Address
                </a>
            </div>
            <p style="color:#888;font-size:0.8rem">
                Or copy this link into your browser:<br/>
                <a href="${link}" style="color:#006ac6;word-break:break-all">${link}</a>
            </p>
            <p style="color:#aaa;font-size:0.75rem;margin-bottom:0">
                If you didn't create an account, you can safely ignore this email.
            </p>
            </div>
        </div>
    `,
    });
};

// ── Send password reset ──────────────────────────────────────────
const sendPasswordResetEmail = async (toEmail, username, token) => {
    const link = `${process.env.CLIENT_URL}/reset-password?token=${token}`;

    await transporter.sendMail({
        from: `"RailManager" <${process.env.GMAIL_USER}>`,
        to: toEmail,
        subject: "Reset your RailManager password",
        html: `
        <div style="font-family:Arial,sans-serif;max-width:520px;margin:0 auto;background:#f6f7f9;border-radius:12px;overflow:hidden">
            <div style="background:linear-gradient(135deg,#072649,#0054a0);padding:2rem;text-align:center">
            <h1 style="color:white;margin:0;font-size:1.5rem">RailManager</h1>
            <p style="color:#7cc4fb;margin:0.5rem 0 0;font-size:0.85rem">Train Management System</p>
            </div>
            <div style="padding:2rem">
            <h2 style="color:#0a3c6d;margin-top:0">Password Reset Request</h2>
            <p style="color:#444;line-height:1.7">
                Hi <strong>${username}</strong>, we received a request to reset your password.
                Click the button below to create a new one. This link expires in <strong>1 hour</strong>.
            </p>
            <div style="text-align:center;margin:2rem 0">
                <a href="${link}"
                style="background:linear-gradient(135deg,#0054a0,#0c87e8);color:white;padding:14px 32px;border-radius:10px;text-decoration:none;font-weight:600;font-size:1rem;display:inline-block">
                Reset Password
                </a>
            </div>
            <p style="color:#888;font-size:0.8rem">
                Or copy this link:<br/>
                <a href="${link}" style="color:#006ac6;word-break:break-all">${link}</a>
            </p>
            <p style="color:#aaa;font-size:0.75rem;margin-bottom:0">
                If you didn't request a password reset, ignore this email. Your password won't change.
            </p>
            </div>
        </div>
    `,
    });
};

module.exports = { sendVerificationEmail, sendPasswordResetEmail };
