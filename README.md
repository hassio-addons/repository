<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>گروه هنری رسانه‌ای قطره</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;700&display=swap');

body {
font-family: 'Vazirmatn', sans-serif;
margin: 0;
padding: 0;
background-color: #f4f4f4;
color: #333;
line-height: 1.6;
overflow-y: auto; /* Make content scrollable */
height: 100vh; /* Ensure body takes full viewport height for scrolling */
}

.container {
width: 90%;
max-width: 600px; /* Constrain width for the iframe */
margin: 0 auto;
padding: 20px 0;
}

header {
background: #2c3e50;
color: #fff;
padding: 1rem 0;
text-align: center;
border-bottom: 5px solid #e74c3c;
}

header h1 {
margin: 0;
font-size: 2.5em;
letter-spacing: 1px;
}

header h1 span {
color: #e74c3c;
}

nav ul {
padding: 0;
list-style: none;
}

nav ul li {
display: inline;
margin: 0 15px;
}

nav ul li a {
color: #fff;
text-decoration: none;
font-weight: bold;
}

nav ul li a:hover {
color: #e74c3c;
}

section {
padding: 40px 0;
border-bottom: 1px solid #ddd;
background-color: #fff;
margin-bottom: 20px;
border-radius: 8px;
box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

section h2 {
text-align: center;
color: #2c3e50;
margin-bottom: 30px;
font-size: 2em;
position: relative;
}

section h2::after {
content: '';
position: absolute;
width: 60px;
height: 3px;
background: #e74c3c;
bottom: -10px;
left: 50%;
transform: translateX(-50%);
}

.hero {
background: url('https://via.placeholder.com/600x300/34495e/ecf0f1?text=Ghatreh+Art+Media+Group') no-repeat center center/cover;
height: 300px;
display: flex;
align-items: center;
justify-content: center;
color: #fff;
text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
text-align: center;
border-radius: 8px;
margin-bottom: 20px;
}

.hero h2 {
font-size: 3em;
margin: 0;
border-bottom: none; /* Remove border from hero h2 */
}

.hero p {
font-size: 1.2em;
margin-top: 10px;
}

.about-content, .portfolio-grid, .contact-info {
padding: 0 20px;
}

.portfolio-grid {
display: grid;
grid-template-columns: 1fr; /* Single column for small screens */
gap: 20px;
}

.portfolio-item {
background: #ecf0f1;
padding: 15px;
text-align: center;
border-radius: 5px;
box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.portfolio-item img {
max-width: 100%;
height: auto;
border-radius: 5px;
margin-bottom: 10px;
}

.contact-info p {
text-align: center;
margin-bottom: 10px;
}

footer {
background: #2c3e50;
color: #fff;
text-align: center;
padding: 1.5rem 0;
margin-top: 20px;
border-top: 5px solid #e74c3c;
border-radius: 8px;
}

/* Responsive adjustments */
@media (min-width: 480px) {
.portfolio-grid {
grid-template-columns: 1fr 1fr; /* Two columns for wider screens */
}
}
</style>
</head>
<body>
<header>
<div class="container">
<h1>گروه هنری رسانه‌ای <span>قطره</span></h1>
<nav>
<ul>
<li><a href="#about">درباره ما</a></li>
<li><a href="#portfolio">نمونه کارها</a></li>
<li><a href="#contact">تماس با ما</a></li>
</ul>
</nav>
</div>
</header>

<div class="container">
<section class="hero">
<div>
<h2>خلاقیت در هر قطره</h2>
<p>همراه شما در خلق ایده‌های هنری و رسانه‌ای نوین</p>
</div>
</section>

<section id="about">
<h2>درباره ما</h2>
<div class="about-content">
<p>گروه هنری رسانه‌ای قطره با تیمی مجرب و خلاق، در زمینه تولید محتوای هنری و رسانه‌ای فعالیت می‌کند. ما معتقدیم که هر ایده یک قطره است که می‌تواند اقیانوسی از خلاقیت را به وجود آورد. هدف ما ارائه خدمات با کیفیت بالا و نوآورانه به مشتریانمان است.</p>
<p>زمینه‌های فعالیت ما شامل: طراحی گرافیک، تولید تیزرهای تبلیغاتی، عکاسی و فیلمبرداری هنری، ساخت انیمیشن و موشن‌گرافیک و مدیریت شبکه‌های اجتماعی است.</p>
</div>
</section>

<section id="portfolio">
<h2>نمونه کارها</h2>
<div class="portfolio-grid">
<div class="portfolio-item">
<img src="https://via.placeholder.com/250x150/5cb85c/ffffff?text=پروژه+۱" alt="پروژه ۱">
<h3>عنوان پروژه ۱</h3>
<p>طراحی گرافیک و هویت بصری.</p>
</div>
<div class="portfolio-item">
<img src="https://via.placeholder.com/250x150/f0ad4e/ffffff?text=پروژه+۲" alt="پروژه ۲">
<h3>عنوان پروژه ۲</h3>
<p>ساخت تیزر تبلیغاتی.</p>
</div>
<div class="portfolio-item">
<img src="https://via.placeholder.com/250x150/337ab7/ffffff?text=پروژه+۳" alt="پروژه ۳">
<h3>عنوان پروژه ۳</h3>
<p>عکاسی صنعتی و تبلیغاتی.</p>
</div>
<div class="portfolio-item">
<img src="https://via.placeholder.com/250x150/d9534f/ffffff?text=پروژه+۴" alt="پروژه ۴">
<h3>عنوان پروژه ۴</h3>
<p>تولید موشن‌گرافیک آموزشی.</p>
</div>
</div>
</section>

<section id="contact">
<h2>تماس با ما</h2>
<div class="contact-info">
<p>برای همکاری و مشاوره می‌توانید از طریق راه‌های ارتباطی زیر با ما در تماس باشید:</p>
<p><strong>ایمیل:</strong> info@ghatrehart.com</p>
<p><strong>تلفن:</strong> 0912-1234567</p>
<p><strong>آدرس:</strong> تهران، خیابان اصلی، کوچه هنر، پلاک ۱۰</p>
</div>
</section>
</div>

<footer>
<div class="container">
<p>&copy; 2023 گروه هنری رسانه‌ای قطره. تمامی حقوق محفوظ است.</p>
</div>
</footer>
</body>
</html>
