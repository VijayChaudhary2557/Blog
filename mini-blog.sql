-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2024 at 03:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini-blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'C', '2024-07-03 09:16:25', '2024-07-03 09:16:25'),
(2, 'C++', '2024-07-03 19:49:50', '2024-07-03 19:49:50'),
(3, 'Python', '2024-07-03 19:51:04', '2024-07-03 19:51:04'),
(4, 'Java', '2024-07-03 19:51:31', '2024-07-03 19:51:31'),
(5, 'Demo', '2024-07-04 23:39:23', '2024-07-04 23:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2024_07_03_134425_create_posts_table', 1),
(13, '2024_07_03_134442_create_categories_table', 1),
(14, '2024_07_03_134516_create_post__categories_table', 1),
(15, '2024_07_03_144858_create_navbar_menus_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `navbar_menus`
--

CREATE TABLE `navbar_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navbar_menus`
--

INSERT INTO `navbar_menus` (`id`, `category_id`, `created_at`, `updated_at`) VALUES
(10, 2, '2024-07-03 23:30:49', '2024-07-03 23:30:49'),
(11, 1, '2024-07-03 23:36:40', '2024-07-03 23:36:40'),
(16, 5, '2024-07-04 23:39:48', '2024-07-04 23:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Introduction C Programming', '<figure class=\"image\"><img src=\"/Images/1720017975_1688275415052.png\"></figure><h2>What is C?</h2><p>C is a general-purpose programming language created by Dennis Ritchie at the Bell Laboratories in 1972.</p><p>It is a very popular language, despite being old. The main reason for its popularity is because it is a fundamental language in the field of computer science.</p><p>C is strongly associated with UNIX, as it was developed to write the UNIX operating system.</p><h2>Why Learn C?</h2><ul><li>It is one of the most popular programming languages in the world</li><li>If you know C, you will have no problem learning other popular programming languages such as Java, Python, C++, C#, etc, as the syntax is similar</li><li>C is very fast, compared to other programming languages, like <a href=\"https://www.w3schools.com/java/default.asp\">Java</a> and <a href=\"https://www.w3schools.com/python/default.asp\">Python</a></li><li>C is very versatile; it can be used in both applications and technologies</li></ul><h2>Difference between C and C++</h2><ul><li><a href=\"https://www.w3schools.com/cpp/default.asp\">C++</a> was developed as an extension of C, and both languages have almost the same syntax</li><li>The main difference between C and C++ is that C++ support classes and objects, while C does not</li></ul>', 'introduction-c-programming', 1, '2024-07-03 09:16:25', '2024-07-03 09:16:25'),
(2, 'Introduction C++', '<h2>What is C++?</h2><p>C++ is a cross-platform language that can be used to create high-performance applications.</p><p>C++ was developed by Bjarne Stroustrup, as an extension to the <a href=\"https://www.w3schools.com/c/index.php\">C language</a>.</p><p>C++ gives programmers a high level of control over system resources and memory.</p><p>The language was updated 4 major times in 2011, 2014, 2017, and 2020 to C++11, C++14, C++17, C++20.</p><h2>Why Use C++</h2><p>C++ is one of the world\'s most popular programming languages.</p><p>C++ can be found in today\'s operating systems, Graphical User Interfaces, and embedded systems.</p><p>C++ is an object-oriented programming language which gives a clear structure to programs and allows code to be reused, lowering development costs.</p><p>C++ is portable and can be used to develop applications that can be adapted to multiple platforms.</p><p>C++ is fun and easy to learn!</p><p>As C++ is close to <a href=\"https://www.w3schools.com/c/index.php\">C</a>, <a href=\"https://www.w3schools.com/cs/index.php\">C#</a> and <a href=\"https://www.w3schools.com/java/default.asp\">Java</a>, it makes it easy for programmers to switch to C++ or vice versa.</p><h2>Difference between C and C++</h2><p>C++ was developed as an extension of <a href=\"https://www.w3schools.com/c/index.php\">C</a>, and both languages have almost the same syntax.</p><p>The main difference between C and C++ is that C++ support classes and objects, while C does not.</p>', 'introduction-c', 1, '2024-07-03 19:49:50', '2024-07-03 19:49:50'),
(3, 'Introduction Python', '<h2>What is Python?</h2><p>Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.</p><p>It is used for:</p><ul><li>web development (server-side),</li><li>software development,</li><li>mathematics,</li><li>system scripting.</li></ul><h3>What can Python do?</h3><ul><li>Python can be used on a server to create web applications.</li><li>Python can be used alongside software to create workflows.</li><li>Python can connect to database systems. It can also read and modify files.</li><li>Python can be used to handle big data and perform complex mathematics.</li><li>Python can be used for rapid prototyping, or for production-ready software development.</li></ul><h3>Why Python?</h3><ul><li>Python works on different platforms (Windows, Mac, Linux, Raspberry Pi, etc).</li><li>Python has a simple syntax similar to the English language.</li><li>Python has syntax that allows developers to write programs with fewer lines than some other programming languages.</li><li>Python runs on an interpreter system, meaning that code can be executed as soon as it is written. This means that prototyping can be very quick.</li><li>Python can be treated in a procedural way, an object-oriented way or a functional way.</li></ul><h3>Good to know</h3><ul><li>The most recent major version of Python is Python 3, which we shall be using in this tutorial. However, Python 2, although not being updated with anything other than security updates, is still quite popular.</li><li>In this tutorial Python will be written in a text editor. It is possible to write Python in an Integrated Development Environment, such as Thonny, Pycharm, Netbeans or Eclipse which are particularly useful when managing larger collections of Python files.</li></ul><h3>Python Syntax compared to other programming languages</h3><ul><li>Python was designed for readability, and has some similarities to the English language with influence from mathematics.</li><li>Python uses new lines to complete a command, as opposed to other programming languages which often use semicolons or parentheses.</li><li>Python relies on indentation, using whitespace, to define scope; such as the scope of loops, functions and classes. Other programming languages often use curly-brackets for this purpose.</li></ul>', 'introduction-python', 1, '2024-07-03 19:51:04', '2024-07-03 19:51:04'),
(4, 'Introduction Java', '<h2>What is Java?</h2><p>Java is a popular programming language, created in 1995.</p><p>It is owned by Oracle, and more than <strong>3 billion</strong> devices run Java.</p><p>It is used for:</p><ul><li>Mobile applications (specially Android apps)</li><li>Desktop applications</li><li>Web applications</li><li>Web servers and application servers</li><li>Games</li><li>Database connection</li><li>And much, much more!</li></ul><h2>Why Use Java?</h2><ul><li>Java works on different platforms (Windows, Mac, Linux, Raspberry Pi, etc.)</li><li>It is one of the most popular programming languages in the world</li><li>It has a large demand in the current job market</li><li>It is easy to learn and simple to use</li><li>It is open-source and free</li><li>It is secure, fast and powerful</li><li>It has huge community support (tens of millions of developers)</li><li>Java is an object oriented language which gives a clear structure to programs and allows code to be reused, lowering development costs</li><li>As Java is close to <a href=\"https://www.w3schools.com/cpp/default.asp\">C++</a> and <a href=\"https://www.w3schools.com/cs/default.asp\">C#</a>, it makes it easy for programmers to switch to Java or vice versa</li></ul>', 'introduction-java', 1, '2024-07-03 19:51:31', '2024-07-03 19:51:31'),
(5, 'Java Syntax', '<h2>Java Syntax</h2><p>In the previous chapter, we created a Java file called Main.java, and we used the following code to print \"Hello World\" to the screen:</p><p>Main.java</p><p>public class Main {</p><p>&nbsp; &nbsp;public static void main(String[] args) {</p><p>&nbsp; &nbsp; &nbsp; &nbsp;System.out.println(\"Hello World\");\r\n &nbsp;</p><p>&nbsp; &nbsp;}\r\n</p><p>}</p><p>\r\n</p><h3>Example explained</h3><p>Every line of code that runs in Java must be inside a class. In our example, we named the class <strong>Main</strong>. A class should always start with an uppercase first letter.</p><p><strong>Note:</strong> Java is case-sensitive: \"MyClass\" and \"myclass\" has different meaning.</p><p>The name of the java file <strong>must match</strong> the class name. When saving the file, save it using the class name and add \".java\" to the end of the filename. To run the example above on your computer, make sure that Java is properly installed: Go to the <a href=\"https://www.w3schools.com/java/java_getstarted.asp\">Get Started Chapter</a> for how to install Java. The output should be:</p><p>Hello World</p><h2>The main Method</h2><p>The main() method is required and you will see it in every Java program:</p><p>public static void <strong>main</strong>(String[] args)\r\n</p><p>Any code inside the main() method will be executed. Don\'t worry about the keywords before and after main. You will get to know them bit by bit while reading this tutorial.</p><p>For now, just remember that every Java program has a class name which must match the filename, and that every program must contain the main() method.</p><h2>System.out.println()</h2><p>Inside the main() method, we can use the println() method to print a line of text to the screen:</p><p>public static void main(String[] args) {\r\n &nbsp;<strong>System.out.println(\"Hello World\");</strong>\r\n}\r\n</p><p><strong>Note:</strong> The curly braces {} marks the beginning and the end of a block of code.</p><p>System is a built-in Java class that contains useful members, such as out, which is short for \"output\". The println() method, short for \"print line\", is used to print a value to the screen (or a file).</p><p>Don\'t worry too much about System, out and println(). Just know that you need them together to print stuff to the screen.</p><p>You should also note that each code statement must end with a semicolon (;).</p>', 'java-syntax', 1, '2024-07-03 19:54:45', '2024-07-03 19:54:45'),
(6, 'Python Variables', '<h2>Variables</h2><p>Variables are containers for storing data values.</p><h2>Creating Variables</h2><p>Python has no command for declaring a variable.</p><p>A variable is created the moment you first assign a value to it.</p><h3>Example<a href=\"https://www.w3schools.com/python/python_server.asp\">Get your own Python Server</a></h3><p>x = 5<br>y = \"John\"<br>print(x)<br>print(y)</p><p><a href=\"https://www.w3schools.com/python/trypython.asp?filename=demo_variables1\">Try it Yourself »</a></p><p>Variables do not need to be declared with any particular <i>type</i>, and can even change type after they have been set.</p><h3>Example</h3><p>x = 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # x is of type int<br>x = \"Sally\" # x is now of type str<br>print(x)</p><p><a href=\"https://www.w3schools.com/python/trypython.asp?filename=demo_variables2\">Try it Yourself »</a></p><h2>Casting</h2><p>If you want to specify the data type of a variable, this can be done with casting.</p><h3>Example</h3><p>x = str(3)&nbsp;&nbsp;&nbsp; # x will be \'3\'<br>y = int(3)&nbsp;&nbsp;&nbsp; # y will be 3<br>z = float(3)&nbsp; # z will be 3.0</p>', 'python-variables', 1, '2024-07-03 23:38:24', '2024-07-03 23:38:24'),
(7, 'C Variables', '<h2>C Variables</h2><p>Variables are containers for storing data values, like numbers and characters.</p><p>In C, there are different <strong>types</strong> of variables (defined with different keywords), for example:</p><ul><li>int - stores integers (whole numbers), without decimals, such as 123 or -123</li><li>float - stores floating point numbers, with decimals, such as 19.99 or -19.99</li><li>char - stores single characters, such as \'a\' or \'B\'. Characters are surrounded by <strong>single quotes</strong></li></ul><h2>Declaring (Creating) Variables</h2><p>To create a variable, specify the <strong>type</strong> and assign it a <strong>value</strong>:</p><h3>Syntax</h3><p><i>type</i> <i>variableName</i> = <i>value</i>;</p><p>Where <i>type</i> is one of C types (such as int), and <i>variableName</i> is the name of the variable (such as <strong>x</strong> or <strong>myName</strong>). The <strong>equal sign</strong> is used to assign a value to the variable.</p><p>So, to create a variable that should <strong>store a number</strong>, look at the following example:</p><h3>Example</h3><p>Create a variable called <strong>myNum</strong> of type int and assign the value <strong>15</strong> to it:</p><p>int myNum = 15;</p><p>You can also declare a variable without assigning the value, and assign the value later:</p><h3>Example</h3><p>// Declare a variable<br>int myNum;<br><br>// Assign a value to the variable<br>myNum = 15;</p><h2>Output Variables</h2><p>You learned from the <a href=\"https://www.w3schools.com/c/c_output.php\">output chapter</a> that you can output values/print text with the printf() function:</p><h3>Example</h3><p>printf(\"Hello World!\");</p><p><a href=\"https://www.w3schools.com/c/tryc.php?filename=demo_variables_printf\">Try it Yourself »</a></p><p>In many other programming languages (like <a href=\"https://www.w3schools.com/python/default.asp\">Python</a>, <a href=\"https://www.w3schools.com/java/default.asp\">Java</a>, and <a href=\"https://www.w3schools.com/cpp/default.asp\">C++</a>), you would normally use a <strong>print function</strong> to display the value of a variable. However, this is not possible in C:</p><h3>Example</h3><p>int myNum = 15;<br>printf(myNum);&nbsp; // Nothing happens</p><p><a href=\"https://www.w3schools.com/c/tryc.php?filename=demo_variables_printf_err\">Try it Yourself »</a></p><p>To output variables in C, you must get familiar with something called \"<a href=\"https://www.w3schools.com/c/c_variables_format.php\">format specifiers</a>\", which you will learn about in the next chapter.</p>', 'c-variables', 1, '2024-07-04 23:38:25', '2024-07-04 23:38:25'),
(8, 'Demo Post', '<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br>&nbsp;</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><h2>Where can I get some?</h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p><figure class=\"table\"><table><tbody><tr><td rowspan=\"2\">&nbsp;</td><td rowspan=\"2\"><p><p>&nbsp;</p></p><p>paragraphs</p><p><p>&nbsp;</p></p><p>words</p><p><p>&nbsp;</p></p><p>bytes</p><p><p>&nbsp;</p></p><p>lists</p></td><td>&nbsp;</td><td>Start with \'Lorem<br>ipsum dolor sit amet...\'</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table></figure><p><br>&nbsp;</p><p><strong>Translations:</strong> Can you help translate this site into a foreign language ? Please email us with details if you can help.</p><p>There is a set of mock banners available <a href=\"https://www.lipsum.com/banners\"><strong>here</strong></a> in three colours and in a range of standard banner sizes:<br>&nbsp;</p><p><strong>Donate:</strong> If you use this site regularly and would like to help keep the site on the Internet, please consider donating a small sum to help pay for the hosting and bandwidth bill. There is no minimum donation, any sum is appreciated - click <a href=\"https://www.lipsum.com/donate\"><strong>here</strong></a> to donate using PayPal. Thank you for your support.</p>', 'demo-post', 1, '2024-07-04 23:39:23', '2024-07-04 23:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 4, 4, NULL, NULL),
(5, 5, 4, NULL, NULL),
(6, 6, 3, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rudra', 'Rudra@gmail.com', NULL, '$2y$10$8UGhLANzXoasFCZ8HbbtO.k5GTYXIyTsagPP4nNbp6I68GowZ.Ada', 't7KIh24ukpaJ0wjXUIBDOklnww0zonZeoCbJelimqH3UXJQoAK5btFADEIn3', '2024-07-03 09:15:25', '2024-07-03 09:15:25'),
(2, 'Aman Sharma', 'amansharma@gmail.com', NULL, '$2y$10$eqAJ8ETO9MQkQW5ebf0iC.LNMGgM.l7elgjj10D7RkoNWtqJ0wVke', NULL, '2024-08-01 20:11:22', '2024-08-01 20:11:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navbar_menus`
--
ALTER TABLE `navbar_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navbar_menus_category_id_unique` (`category_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_categories_post_id_foreign` (`post_id`),
  ADD KEY `post_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `navbar_menus`
--
ALTER TABLE `navbar_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `navbar_menus`
--
ALTER TABLE `navbar_menus`
  ADD CONSTRAINT `navbar_menus_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD CONSTRAINT `post_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
