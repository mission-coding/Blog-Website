-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2024 at 05:14 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogforbloggers`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `s.no` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`s.no`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`s.no`, `name`, `email`, `phone`, `message`, `date`) VALUES
(1, 'Rameshwari', 'monu78851@gmail.com', '09873504324', 'this is good', '2024-05-11 17:03:35'),
(5, 'my name', 'myname@gmail.com', '4545454545', 'my name is my name and your name is your name', '2024-05-12 21:57:09'),
(4, 'Vivek', 'monu78851@gmail.com', '09873504324', 'this is my message', '2024-05-12 21:22:37'),
(6, 'my name', 'myname@gmail.com', '4545454545', 'my name is my name and your name is your name', '2024-05-12 21:57:57'),
(7, 'fdfdf', 'vivek14128@gmail.com', 'fdfdfsf', 'fdffdsf', '2024-05-12 22:20:05'),
(8, 'Rameshwari', 'monu78851@gmail.com', '354645465', 'ab send ho ha mail', '2024-05-12 22:21:37'),
(9, 'Rameshwari', 'monu78851@gmail.com', '354645465', 'ab send ho ha mail', '2024-05-12 22:23:54'),
(10, 'Monu', 'monu78851@gmail.com', '09873504324', 'This is monu and i want to say that i loved you Coding blog. This is the best blog i have ever seen. this help me a lot, Thank you\r\nI want to ask you for a favor that is i want to buy your blog. if you interesed please let me know', '2024-05-12 22:32:01'),
(11, 'Eren Jeager', 'eren@gmail.com', '4544545645', 'this is eren', '2024-05-13 10:42:34'),
(12, 'R34567', 'monu78851@gmail.com', '09873504324', '2354676879aeysrdyfkuilfhgukilhvhfcgj', '2024-05-13 10:46:56'),
(13, 'Armin', 'monu78851@gmail.com', '09873504324', 'this is Armin', '2024-05-13 11:00:42'),
(14, 'Levi', 'monu78851@gmail.com', '4544545645', 'this is levi', '2024-05-13 11:02:15'),
(15, 'Rameshwari', 'monu78851@gmail.com', '09873504324', 'ftryyjgkhjli6yt', '2024-05-20 20:55:56'),
(16, 'Rameshwari', 'monu78851@gmail.com', '09873504324', 'ftryyjgkhjli6yt', '2024-05-20 20:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `sub_title` text NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slug` varchar(30) NOT NULL,
  `img` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `sub_title`, `content`, `date`, `slug`, `img`) VALUES
(1, 'What is Coding?', 'text-based coding is like humor', 'Computer programming or coding is the composition of sequences of instructions, called programs, that computers can follow to perform tasks.[1][2] It involves designing and implementing algorithms, step-by-step specifications of procedures, by writing code in one or more programming languages. Programmers typically use high-level programming languages that are more easily intelligible to humans than machine code, which is directly executed by the central processing unit. Proficient programming usually requires expertise in several different subjects, including knowledge of the application domain, details of programming languages and generic code libraries, specialized algorithms, and formal logic.\r\n\r\nAuxiliary tasks accompanying and related to programming include analyzing requirements, testing, debugging (investigating and fixing problems), implementation of build systems, and management of derived artifacts, such as programs\' machine code. While these are sometimes considered programming, often the term software development is used for this larger overall process – with the terms programming, implementation, and coding reserved for the writing and editing of code per se. Sometimes software development is known as software engineering, especially when it employs formal methods or follows an engineering design process.', '2024-05-13 17:58:54', 'what-is-coding', 'coding.jpg'),
(2, 'The Anime', 'Anime is about emotions.', 'Anime (Japanese: アニメ, IPA: [aꜜɲime] ⓘ) is hand-drawn and computer-generated animation originating from Japan. Outside Japan and in English, anime refers specifically to animation produced in Japan. However, in Japan and Japanese, anime (a term derived from a shortening of the English word animation) describes all animated works, regardless of style or origin. Many works of animation with a similar style to Japanese animation are also produced outside Japan. Video games sometimes also feature themes and art styles that are sometimes labelled as anime.\r\n\r\nThe earliest commercial Japanese animation dates to 1917. A characteristic art style emerged in the 1960s with the works of cartoonist Osamu Tezuka and spread in following decades, developing a large domestic audience. Anime is distributed theatrically, through television broadcasts, directly to home media, and over the Internet. In addition to original works, anime are often adaptations of Japanese comics (manga), light novels, or video games. It is classified into numerous genres targeting various broad and niche audiences.\r\n\r\nAnime is a diverse medium with distinctive production methods that have adapted in response to emergent technologies. It combines graphic art, characterization, cinematography, and other forms of imaginative and individualistic techniques. Compared to Western animation, anime production generally focuses less on movement, and more on the detail of settings and use of \"camera effects\", such as panning, zooming, and angle shots. Diverse art styles are used, and character proportions and features can be quite varied, with a common characteristic feature being large and emotive eyes.\r\n\r\nThe anime industry consists of over 430 production companies, including major studios such as Studio Ghibli, Kyoto Animation, Sunrise, Bones, Ufotable, MAPPA, Wit Studio, CoMix Wave Films, Production I.G, and Toei Animation. Since the 1980s, the medium has also seen widespread international success with the rise of foreign dubbed, subtitled programming, and since the 2010s due to the rise of streaming services and a widening demographic embrace of anime culture, both within Japan and worldwide. As of 2016, Japanese animation accounted for 60% of the world\'s animated television shows.', '2024-05-14 20:03:40', 'the-anime', 'anime.jpg'),
(3, 'Stock Market', 'Unlock Your Wealth, Empower Yourself.', 'A stock market, equity market, or share market is the aggregation of buyers and sellers of stocks (also called shares), which represent ownership claims on businesses; these may include securities listed on a public stock exchange as well as stock that is only traded privately, such as shares of private companies that are sold to investors through equity crowdfunding platforms. Investments are usually made with an investment strategy in mind.\r\n\r\nSize of the market\r\nThe total market capitalization of all publicly traded stocks worldwide rose from US$2.5 trillion in 1980 to US$93.7 trillion at the end of 2020.\r\n\r\nAs of 2016, there are 60 stock exchanges in the world. Of these, there are 16 exchanges with a market capitalization of $1 trillion or more, and they account for 87% of global market capitalization. Apart from the Australian Securities Exchange, these 16 exchanges are all in North America, Europe, or Asia.\r\n\r\nBy country, the largest stock markets as of January 2022 are in the United States of America (about 59.9%), followed by Japan (about 6.2%) and United Kingdom (about 3.9%).\r\n\r\nStock exchange\r\nMain article: Stock exchange\r\n\r\nInterior hall of the Helsinki Stock Exchange in Helsinki, Finland, 1965\r\nA stock exchange is an exchange (or bourse) where stockbrokers and traders can buy and sell shares (equity stock), bonds, and other securities. Many large companies have their stocks listed on a stock exchange. This makes the stock more liquid and thus more attractive to many investors. The exchange may also act as a guarantor of settlement. These and other stocks may also be traded \"over the counter\" (OTC), that is, through a dealer. Some large companies will have their stock listed on more than one exchange in different countries, so as to attract international investors.[4]\r\n\r\nStock exchanges may also cover other types of securities, such as fixed-interest securities (bonds) or (less frequently) derivatives, which are more likely to be traded OTC.\r\n\r\nTrade in stock markets means the transfer (in exchange for money) of a stock or security from a seller to a buyer. This requires these two parties to agree on a price. Equities (stocks or shares) confer an ownership interest in a particular company.\r\n\r\nParticipants in the stock market range from small individual stock investors to larger investors, who can be based anywhere in the world, and may include banks, insurance companies, pension funds and hedge funds. Their buy or sell orders may be executed on their behalf by a stock exchange trader.\r\n\r\nSome exchanges are physical locations where transactions are carried out on a trading floor, by a method known as open outcry. This method is used in some stock exchanges and commodities exchanges, and involves traders shouting bid and offer prices. The other type of stock exchange has a network of computers where trades are made electronically. An example of such an exchange is the NASDAQ.\r\n\r\nA potential buyer bids a specific price for a stock, and a potential seller asks a specific price for the same stock. Buying or selling at the Market means you will accept any ask price or bid price for the stock. When the bid and ask prices match, a sale takes place, on a first-come, first-served basis if there are multiple bidders at a given price.\r\n\r\nThe purpose of a stock exchange is to facilitate the exchange of securities between buyers and sellers, thus providing a marketplace. The exchanges provide real-time trading information on the listed securities, facilitating price discovery.\r\n\r\nThe New York Stock Exchange (NYSE) is a physical exchange, with a hybrid market for placing orders electronically from any location as well as on the trading floor. Orders executed on the trading floor enter by way of exchange members and flow down to a floor broker, who submits the order electronically to the floor trading post for the Designated market maker (\"DMM\") for that stock to trade the order. The DMM\'s job is to maintain a two-sided market, making orders to buy and sell the security when there are no other buyers or sellers. If a bid–ask spread exists, no trade immediately takes place – in this case, the DMM may use their own resources (money or stock) to close the difference. Once a trade has been made, the details are reported on the \"tape\" and sent back to the brokerage firm, which then notifies the investor who placed the order. Computers play an important role, especially for program trading.\r\n\r\nThe NASDAQ is an electronic exchange, where all of the trading is done over a computer network. The process is similar to the New York Stock Exchange. One or more NASDAQ market makers will always provide a bid and ask the price at which they will always purchase or sell \'their\' stock.\r\n\r\nThe Paris Bourse, now part of Euronext, is an order-driven, electronic stock exchange. It was automated in the late 1980s. Prior to the 1980s, it consisted of an open outcry exchange. Stockbrokers met on the trading floor of the Palais Brongniart. In 1986, the CATS trading system was introduced, and the order matching system was fully automated.\r\n\r\nPeople trading stock will prefer to trade on the most popular exchange since this gives the largest number of potential counter parties (buyers for a seller, sellers for a buyer) and probably the best price. However, there have always been alternatives such as brokers trying to bring parties together to trade outside the exchange. Some third markets that were popular are Instinet, and later Island and Archipelago (the latter two have since been acquired by Nasdaq and NYSE, respectively). One advantage is that this avoids the commissions of the exchange. However, it also has problems such as adverse selection. Financial regulators have probed dark pools.', '2024-05-15 11:28:44', 'stock-market', 'stock_market.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
