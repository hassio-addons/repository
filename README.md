<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PixelPilot - پنل کاربری</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;500;600;700&display=swap');
        
        body {
            font-family: 'Vazirmatn', sans-serif;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(120, 219, 255, 0.2) 0%, transparent 50%);
            z-index: -2;
        }
        
        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                linear-gradient(45deg, rgba(255,255,255,0.1) 25%, transparent 25%),
                linear-gradient(-45deg, rgba(255,255,255,0.1) 25%, transparent 25%),
                linear-gradient(45deg, transparent 75%, rgba(255,255,255,0.1) 75%),
                linear-gradient(-45deg, transparent 75%, rgba(255,255,255,0.1) 75%);
            background-size: 60px 60px;
            background-position: 0 0, 0 30px, 30px -30px, -30px 0px;
            animation: movePattern 20s linear infinite;
            z-index: -1;
        }
        
        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        @keyframes movePattern {
            0% { transform: translate(0, 0); }
            100% { transform: translate(60px, 60px); }
        }
        
        .gradient-bg {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.95) 0%, rgba(118, 75, 162, 0.95) 100%);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }
        
        .gradient-bg::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            animation: shine 3s infinite;
        }
        
        @keyframes shine {
            0% { left: -100%; }
            100% { left: 100%; }
        }
        
        .card-hover {
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .card-hover::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent 30%, rgba(255,255,255,0.1) 50%, transparent 70%);
            transform: translateX(-100%);
            transition: transform 0.6s;
        }
        
        .card-hover:hover::before {
            transform: translateX(100%);
        }
        
        .card-hover:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0,0,0,0.2);
        }
        
        .stats-card {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }
        
        .online-indicator {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.5; transform: scale(1.1); }
        }
        
        .glass-effect {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }
        
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }
        
        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }
        
        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 70%;
            left: 80%;
            animation-delay: 2s;
        }
        
        .shape:nth-child(3) {
            width: 60px;
            height: 60px;
            top: 40%;
            left: 70%;
            animation-delay: 4s;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }
        
        .neon-glow {
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.5);
            animation: neonPulse 2s ease-in-out infinite alternate;
        }
        
        @keyframes neonPulse {
            from { box-shadow: 0 0 20px rgba(102, 126, 234, 0.5); }
            to { box-shadow: 0 0 30px rgba(102, 126, 234, 0.8), 0 0 40px rgba(102, 126, 234, 0.6); }
        }
        
        .particle-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }
        
        .particle {
            position: absolute;
            width: 4px;
            height: 4px;
            background: rgba(255, 255, 255, 0.6);
            border-radius: 50%;
            animation: particleFloat 8s linear infinite;
        }
        
        @keyframes particleFloat {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }
    </style>
</head>
<body class="bg-gray-100">
    <!-- Floating Shapes -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <!-- Particle Background -->
    <div class="particle-bg" id="particles"></div>
    
    <!-- Login Screen -->
    <div id="loginScreen" class="fixed inset-0 z-50 flex items-center justify-center">
        <div class="glass-effect rounded-2xl p-8 w-full max-w-md mx-4 neon-glow">
            <div class="text-center mb-8">
                <div class="w-20 h-20 bg-gradient-to-br from-purple-600 to-blue-600 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span class="text-3xl font-bold text-white">P</span>
                </div>
                <h1 class="text-3xl font-bold text-gray-800 mb-2">PixelPilot</h1>
                <p class="text-gray-600">ورود به پنل کاربری</p>
            </div>
            
            <form id="loginForm" class="space-y-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">نام کاربری</label>
                    <input type="text" id="username" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent transition-all bg-white bg-opacity-80" placeholder="نام کاربری خود را وارد کنید" required>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">رمز عبور</label>
                    <input type="password" id="password" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent transition-all bg-white bg-opacity-80" placeholder="رمز عبور خود را وارد کنید" required>
                </div>
                
                <div class="flex items-center justify-between">
                    <label class="flex items-center">
                        <input type="checkbox" class="rounded border-gray-300 text-purple-600 focus:ring-purple-500">
                        <span class="mr-2 text-sm text-gray-600">مرا به خاطر بسپار</span>
                    </label>
                    <a href="#" class="text-sm text-purple-600 hover:text-purple-800">فراموشی رمز عبور؟</a>
                </div>
                
                <button type="submit" class="w-full bg-gradient-to-r from-purple-600 to-blue-600 text-white py-3 px-4 rounded-lg hover:from-purple-700 hover:to-blue-700 transition-all transform hover:scale-105 font-medium">
                    ورود به بازی
                </button>
            </form>
            
            <div class="mt-6 text-center">
                <p class="text-sm text-gray-600">حساب کاربری ندارید؟ <a href="#" class="text-purple-600 hover:text-purple-800 font-medium">ثبت نام کنید</a></p>
            </div>
            
            <div class="mt-6 pt-6 border-t border-gray-200">
                <div class="text-center text-sm text-gray-500">
                    <p>🎮 برای ثبت سفارش پیوی @iMatin01</p>
                    <p class="mt-1">247 بازیکن آنلاین</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Main Dashboard (Hidden Initially) -->
    <div id="mainDashboard" class="hidden">
    <!-- Header -->
    <header class="gradient-bg text-white shadow-lg">
        <div class="container mx-auto px-4 py-6">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-4 space-x-reverse">
                    <div class="w-12 h-12 bg-white rounded-full flex items-center justify-center">
                        <span class="text-2xl font-bold text-purple-600">P</span>
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold">PixelPilot</h1>
                        <p class="text-purple-200">پنل کاربری سرور</p>
                    </div>
                </div>
                <div class="flex items-center space-x-4 space-x-reverse">
                    <div class="flex items-center space-x-2 space-x-reverse">
                        <div class="w-3 h-3 bg-green-400 rounded-full online-indicator"></div>
                        <span class="text-sm">آنلاین: 247 نفر</span>
                    </div>
                    <button class="bg-white bg-opacity-20 hover:bg-opacity-30 px-4 py-2 rounded-lg transition-all">
                        خروج
                    </button>
                </div>
            </div>
        </div>
    </header>

    <!-- Navigation -->
    <nav class="bg-white shadow-md">
        <div class="container mx-auto px-4">
            <div class="flex space-x-8 space-x-reverse">
                <a href="#" class="py-4 px-2 border-b-2 border-purple-500 text-purple-600 font-medium">داشبورد</a>
                <a href="#" class="py-4 px-2 text-gray-600 hover:text-purple-600 transition-colors">پروفایل</a>
                <a href="#" class="py-4 px-2 text-gray-600 hover:text-purple-600 transition-colors">آمار</a>
                <a href="#" class="py-4 px-2 text-gray-600 hover:text-purple-600 transition-colors">تنظیمات</a>
                <a href="#" class="py-4 px-2 text-gray-600 hover:text-purple-600 transition-colors">پشتیبانی</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8">
        <!-- Welcome Section -->
        <div class="glass-effect rounded-lg shadow-md p-6 mb-8 neon-glow">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-2xl font-bold text-gray-800 mb-2">خوش آمدید، کاربر عزیز!</h2>
                    <p class="text-gray-600">آخرین ورود: امروز ساعت 14:30</p>
                </div>
                <div class="text-left">
                    <div class="text-3xl font-bold text-purple-600">1,247</div>
                    <div class="text-sm text-gray-500">امتیاز کل</div>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow-md p-6 card-hover">
                <div class="flex items-center">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center ml-4">
                        <span class="text-2xl">👤</span>
                    </div>
                    <div>
                        <div class="text-2xl font-bold text-gray-800">156</div>
                        <div class="text-sm text-gray-500">ساعت بازی</div>
                    </div>
                </div>
            </div>
            
            <div class="bg-white rounded-lg shadow-md p-6 card-hover">
                <div class="flex items-center">
                    <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center ml-4">
                        <span class="text-2xl">💰</span>
                    </div>
                    <div>
                        <div class="text-2xl font-bold text-gray-800">$45,230</div>
                        <div class="text-sm text-gray-500">پول در بازی</div>
                    </div>
                </div>
            </div>
            
            <div class="bg-white rounded-lg shadow-md p-6 card-hover">
                <div class="flex items-center">
                    <div class="w-12 h-12 bg-yellow-100 rounded-lg flex items-center justify-center ml-4">
                        <span class="text-2xl">🏆</span>
                    </div>
                    <div>
                        <div class="text-2xl font-bold text-gray-800">23</div>
                        <div class="text-sm text-gray-500">دستاورد</div>
                    </div>
                </div>
            </div>
            
            <div class="bg-white rounded-lg shadow-md p-6 card-hover">
                <div class="flex items-center">
                    <div class="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center ml-4">
                        <span class="text-2xl">🚗</span>
                    </div>
                    <div>
                        <div class="text-2xl font-bold text-gray-800">7</div>
                        <div class="text-sm text-gray-500">خودرو</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Dashboard Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Player Info -->
            <div class="lg:col-span-2">
                <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-4">اطلاعات شخصیت</h3>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <div class="text-sm text-gray-500 mb-1">نام شخصیت</div>
                            <div class="font-semibold">@iMatin01</div>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <div class="text-sm text-gray-500 mb-1">سطح</div>
                            <div class="font-semibold">Level 45</div>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <div class="text-sm text-gray-500 mb-1">شغل</div>
                            <div class="font-semibold">DepartMent</div>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <div class="text-sm text-gray-500 mb-1">گروه</div>
                            <div class="font-semibold">@p1xelPilot</div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-4">فعالیت‌های اخیر</h3>
                    <div class="space-y-4">
                        <div class="flex items-center p-3 bg-gray-50 rounded-lg">
                            <div class="w-10 h-10 bg-green-100 rounded-full flex items-center justify-center ml-3">
                                <span class="text-green-600">✓</span>
                            </div>
                            <div class="flex-1">
                                <div class="font-medium">ماموریت تکمیل شد</div>
                                <div class="text-sm text-gray-500">2 ساعت پیش</div>
                            </div>
                            <div class="text-green-600 font-semibold">+500 XP</div>
                        </div>
                        
                        <div class="flex items-center p-3 bg-gray-50 rounded-lg">
                            <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center ml-3">
                                <span class="text-blue-600">💰</span>
                            </div>
                            <div class="flex-1">
                                <div class="font-medium">حقوق دریافت شد</div>
                                <div class="text-sm text-gray-500">5 ساعت پیش</div>
                            </div>
                            <div class="text-blue-600 font-semibold">+$2,500</div>
                        </div>
                        
                        <div class="flex items-center p-3 bg-gray-50 rounded-lg">
                            <div class="w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center ml-3">
                                <span class="text-purple-600">🏆</span>
                            </div>
                            <div class="flex-1">
                                <div class="font-medium">دستاورد جدید</div>
                                <div class="text-sm text-gray-500">1 روز پیش</div>
                            </div>
                            <div class="text-purple-600 font-semibold">شهروند نمونه</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="space-y-6">
                <!-- Server Status -->
                <div class="glass-effect rounded-lg shadow-md p-6 neon-glow">
                    <h3 class="text-xl font-bold text-gray-800 mb-4">وضعیت سرور</h3>
                    <div class="space-y-3">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-600">بازیکنان آنلاین</span>
                            <span class="font-semibold text-green-600">247/300</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2">
                            <div class="bg-green-500 h-2 rounded-full" style="width: 82%"></div>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-600">وضعیت سرور</span>
                            <span class="flex items-center text-green-600">
                                <div class="w-2 h-2 bg-green-500 rounded-full ml-2"></div>
                                آنلاین
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="glass-effect rounded-lg shadow-md p-6 neon-glow">
                    <h3 class="text-xl font-bold text-gray-800 mb-4">عملیات سریع</h3>
                    <div class="space-y-3">
                        <button class="w-full bg-purple-600 hover:bg-purple-700 text-white py-2 px-4 rounded-lg transition-colors">
                            تغییر رمز عبور
                        </button>
                        <button class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg transition-colors">
                            مشاهده آمار کامل
                        </button>
                        <button class="w-full bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-lg transition-colors">
                            پشتیبانی
                        </button>
                    </div>
                </div>

                <!-- Latest News -->
                <div class="glass-effect rounded-lg shadow-md p-6 neon-glow">
                    <h3 class="text-xl font-bold text-gray-800 mb-4">آخرین اخبار</h3>
                    <div class="space-y-4">
                        <div class="border-r-4 border-purple-500 pr-4">
                            <div class="font-medium text-gray-800">آپدیت جدید سرور</div>
                            <div class="text-sm text-gray-500">امکانات جدید اضافه شد</div>
                            <div class="text-xs text-gray-400 mt-1">2 روز پیش</div>
                        </div>
                        <div class="border-r-4 border-blue-500 pr-4">
                            <div class="font-medium text-gray-800">رویداد ویژه</div>
                            <div class="text-sm text-gray-500">جوایز دوبرابر تا پایان هفته</div>
                            <div class="text-xs text-gray-400 mt-1">5 روز پیش</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-8 mt-12">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div>
                    <h4 class="text-lg font-bold mb-4">@P1xelPilot</h4>
                    <p class="text-gray-400">برای ثبت سفارش پیوی @iMatin01</p>
                </div>
                <div>
                    <h4 class="text-lg font-bold mb-4">لینک‌های مفید</h4>
                    <ul class="space-y-2 text-gray-400">
                        <li><a href="#" class="hover:text-white transition-colors">قوانین سرور</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">راهنمای بازی</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">انجمن</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-lg font-bold mb-4">تماس با ما</h4>
                    <ul class="space-y-2 text-gray-400">
                        <li>دیسکورد: P1xelPilot</li>
                        <li>تلگرام: @P1xelPilot</li>
                        <li>ایمیل:Matin00460@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="border-t border-gray-700 mt-8 pt-8 text-center text-gray-400">
                <p>&copy; 2024 PixelPilot. تمامی حقوق محفوظ است.</p>
            </div>
        </div>
    </footer>
    </div> <!-- End Main Dashboard -->

    <script>
        // Create floating particles
        function createParticles() {
            const particleContainer = document.getElementById('particles');
            const particleCount = 50;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 8 + 's';
                particle.style.animationDuration = (Math.random() * 3 + 5) + 's';
                particleContainer.appendChild(particle);
            }
        }

        // Initialize particles on load
        window.addEventListener('load', createParticles);

        // Simulate real-time updates
        function updateOnlineCount() {
            const count = Math.floor(Math.random() * 20) + 240;
            document.querySelector('.online-indicator').parentElement.innerHTML = 
                '<div class="w-3 h-3 bg-green-400 rounded-full online-indicator"></div><span class="text-sm">آنلاین: ' + count + ' نفر</span>';
        }

        // Update every 30 seconds
        setInterval(updateOnlineCount, 30000);

        // Login form handler
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
            if (username && password) {
                // Add loading animation
                const submitBtn = this.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'در حال ورود...';
                submitBtn.disabled = true;
                
                // Simulate login process
                setTimeout(() => {
                    document.getElementById('loginScreen').style.display = 'none';
                    document.getElementById('mainDashboard').classList.remove('hidden');
                    
                    // Show welcome message
                    setTimeout(() => {
                        alert(`خوش آمدید ${username}! با موفقیت وارد شدید.`);
                    }, 500);
                }, 2000);
            }
        });

        // Add click handlers for buttons
        document.addEventListener('click', function(e) {
            if (e.target.tagName === 'BUTTON' && !e.target.type === 'submit') {
                // Add click animation
                e.target.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    e.target.style.transform = 'scale(1)';
                }, 150);
                
                if (e.target.textContent.includes('خروج')) {
                    // Logout functionality
                    if (confirm('آیا مطمئن هستید که می‌خواهید خارج شوید؟')) {
                        document.getElementById('mainDashboard').classList.add('hidden');
                        document.getElementById('loginScreen').style.display = 'flex';
                        
                        // Reset form
                        document.getElementById('loginForm').reset();
                        const submitBtn = document.querySelector('#loginForm button[type="submit"]');
                        submitBtn.textContent = 'ورود به بازی';
                        submitBtn.disabled = false;
                    }
                } else if (e.target.textContent.includes('تغییر رمز')) {
                    alert('صفحه تغییر رمز عبور');
                } else if (e.target.textContent.includes('آمار')) {
                    alert('مشاهده آمار کامل');
                } else if (e.target.textContent.includes('پشتیبانی')) {
                    alert('ارتباط با پشتیبانی');
                }
            }
        });

        // Enhanced hover effects for cards
        document.querySelectorAll('.card-hover').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-10px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Add parallax effect to floating shapes
        window.addEventListener('mousemove', (e) => {
            const shapes = document.querySelectorAll('.shape');
            const x = e.clientX / window.innerWidth;
            const y = e.clientY / window.innerHeight;
            
            shapes.forEach((shape, index) => {
                const speed = (index + 1) * 0.5;
                const xPos = (x - 0.5) * speed * 50;
                const yPos = (y - 0.5) * speed * 50;
                shape.style.transform = `translate(${xPos}px, ${yPos}px)`;
            });
        });

        // Add scroll animations
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const parallax = document.querySelector('.floating-shapes');
            const speed = scrolled * 0.5;
            parallax.style.transform = `translateY(${speed}px)`;
        });
    </script>
<script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'97afd8c380275cc8',t:'MTc1NzE4MTQyNS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>
