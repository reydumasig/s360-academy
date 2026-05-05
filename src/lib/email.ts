import nodemailer from 'nodemailer'

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.GMAIL_USER,
    pass: process.env.GMAIL_APP_PASSWORD,
  },
})

const FROM = `S360 Academy <${process.env.GMAIL_USER}>`
const APP_URL = process.env.NEXT_PUBLIC_APP_URL ?? 'https://s360-academy-phi.vercel.app'

export async function sendCertificateEmail({
  to,
  learnerName,
  moduleTitle,
  levelLabel,
  certId,
  moduleCode,
  issuedAt,
}: {
  to: string
  learnerName: string
  moduleTitle: string
  levelLabel: string
  certId: string
  moduleCode: string
  issuedAt: string
}) {
  const certUrl = `${APP_URL}/certificates/${moduleCode}`
  const dateStr = new Date(issuedAt).toLocaleDateString('en-US', {
    year: 'numeric', month: 'long', day: 'numeric',
  })

  const html = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Certificate of Completion — ${moduleTitle}</title>
</head>
<body style="margin:0;padding:0;background:#0F1115;font-family:Georgia,serif;">
<table width="100%" cellpadding="0" cellspacing="0" style="background:#0F1115;padding:40px 20px;">
  <tr><td align="center">
    <table width="600" cellpadding="0" cellspacing="0" style="background:#1C2030;border:1px solid #2A3044;border-radius:12px;overflow:hidden;max-width:600px;width:100%;">

      <!-- Header -->
      <tr>
        <td style="background:#161922;padding:28px 40px;border-bottom:1px solid #2A3044;">
          <table cellpadding="0" cellspacing="0">
            <tr>
              <td style="width:10px;height:10px;background:#E15A4C;border-radius:50%;vertical-align:middle;"></td>
              <td style="padding-left:8px;font-family:Arial,sans-serif;font-size:11px;font-weight:600;letter-spacing:2px;text-transform:uppercase;color:#F2F4F8;vertical-align:middle;">Summit 360</td>
            </tr>
          </table>
        </td>
      </tr>

      <!-- Gold accent bar -->
      <tr>
        <td style="height:3px;background:linear-gradient(90deg,#1F7A8C,#E7C36A);"></td>
      </tr>

      <!-- Body -->
      <tr>
        <td style="padding:48px 40px 40px;">
          <p style="margin:0 0 8px;font-family:Arial,sans-serif;font-size:11px;font-weight:600;letter-spacing:2px;text-transform:uppercase;color:#1F7A8C;">Certificate of Completion</p>
          <h1 style="margin:0 0 24px;font-size:28px;font-weight:700;color:#F2F4F8;line-height:1.2;">Congratulations,<br/>${learnerName}.</h1>

          <p style="margin:0 0 24px;font-family:Arial,sans-serif;font-size:15px;color:#C5CAD8;line-height:1.6;">
            You have successfully completed <strong style="color:#F2F4F8;">${moduleTitle}</strong> — part of the Pathfinder AI Academy ${levelLabel}.
          </p>

          <!-- Cert card -->
          <table width="100%" cellpadding="0" cellspacing="0" style="background:#161922;border:1px solid #E7C36A33;border-radius:8px;margin-bottom:32px;">
            <tr>
              <td style="padding:20px 24px;">
                <p style="margin:0 0 4px;font-family:Arial,sans-serif;font-size:10px;font-weight:600;letter-spacing:1.5px;text-transform:uppercase;color:#E7C36A;">Certificate ID</p>
                <p style="margin:0 0 12px;font-family:'Courier New',monospace;font-size:14px;color:#F2F4F8;">${certId}</p>
                <p style="margin:0;font-family:Arial,sans-serif;font-size:12px;color:#8A93A8;">Issued ${dateStr}</p>
              </td>
            </tr>
          </table>

          <!-- CTA -->
          <table cellpadding="0" cellspacing="0">
            <tr>
              <td style="background:#1F7A8C;border-radius:8px;">
                <a href="${certUrl}" style="display:inline-block;padding:14px 28px;font-family:Arial,sans-serif;font-size:14px;font-weight:600;color:#ffffff;text-decoration:none;letter-spacing:0.3px;">View Certificate →</a>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <!-- Signatories -->
      <tr>
        <td style="padding:0 40px 40px;">
          <table cellpadding="0" cellspacing="0" style="border-top:1px solid #2A3044;padding-top:24px;width:100%;">
            <tr>
              <td style="padding-right:24px;">
                <p style="margin:0 0 2px;font-family:Georgia,serif;font-size:13px;font-weight:700;color:#F2F4F8;">Lane Elmer</p>
                <p style="margin:0;font-family:Arial,sans-serif;font-size:11px;color:#8A93A8;">CEO, Summit 360</p>
              </td>
              <td style="padding-right:24px;">
                <p style="margin:0 0 2px;font-family:Georgia,serif;font-size:13px;font-weight:700;color:#F2F4F8;">Adot Diuyan</p>
                <p style="margin:0;font-family:Arial,sans-serif;font-size:11px;color:#8A93A8;">COO, Summit 360</p>
              </td>
              <td>
                <p style="margin:0 0 2px;font-family:Georgia,serif;font-size:13px;font-weight:700;color:#F2F4F8;">Rey Dumasig</p>
                <p style="margin:0;font-family:Arial,sans-serif;font-size:11px;color:#8A93A8;">Director, AI &amp; Technology</p>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <!-- Footer -->
      <tr>
        <td style="background:#161922;padding:20px 40px;border-top:1px solid #2A3044;">
          <p style="margin:0;font-family:Arial,sans-serif;font-size:11px;color:#8A93A8;">
            Pathfinder AI Academy &nbsp;·&nbsp; Summit 360 &nbsp;·&nbsp; <a href="${APP_URL}" style="color:#1F7A8C;text-decoration:none;">${APP_URL.replace('https://', '')}</a>
          </p>
        </td>
      </tr>

    </table>
  </td></tr>
</table>
</body>
</html>`

  const text = `Congratulations, ${learnerName}!\n\nYou have completed ${moduleTitle} — ${levelLabel}.\n\nCertificate ID: ${certId}\nIssued: ${dateStr}\n\nView your certificate: ${certUrl}\n\n— Rey Leonard Dumasig, Founder & CEO, Summit 360`

  return transporter.sendMail({
    from: FROM,
    to,
    subject: `🎓 Certificate earned — ${moduleTitle}`,
    html,
    text,
  })
}
