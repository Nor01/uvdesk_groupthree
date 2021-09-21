-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2021 a las 23:53:03
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `uvdesk_group3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agent_activity`
--

CREATE TABLE `agent_activity` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `agent_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thread_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20210823141048', '2021-09-21 21:31:46'),
('20210921213146', '2021-09-21 21:35:53'),
('20210921213553', '2021-09-21 21:36:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recaptcha`
--

CREATE TABLE `recaptcha` (
  `id` int(11) NOT NULL,
  `site_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_admin_support_groups`
--

CREATE TABLE `uv_admin_support_groups` (
  `adminUserInstanceId` int(11) NOT NULL,
  `supportGroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_article`
--

CREATE TABLE `uv_article` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `stared` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_article_category`
--

CREATE TABLE `uv_article_category` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_article_feedback`
--

CREATE TABLE `uv_article_feedback` (
  `id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_helpful` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_article_history`
--

CREATE TABLE `uv_article_history` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_article_tags`
--

CREATE TABLE `uv_article_tags` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_article_view_log`
--

CREATE TABLE `uv_article_view_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `viewed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_email_templates`
--

CREATE TABLE `uv_email_templates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_predefined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_email_templates`
--

INSERT INTO `uv_email_templates` (`id`, `user_id`, `name`, `subject`, `message`, `template_type`, `is_predefined`) VALUES
(1, NULL, 'User Forgot Password', 'Update your {%global.companyName%} helpdesk password', '    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p>\n    <p>Hi&nbsp;{%user.userName%},\n        <br />\n    </p>\n    <p>\n        <br />\n    </p>\n    <p>You recently requested to reset your password for your {%global.companyName%} account. Click the link to reset it&nbsp;{%user.forgotPasswordLink%}</p>\n    <p>\n        <br />\n    </p>\n    <p>If you did not request a password reset, please ignore this mail or revert back to let us know.</p>\n    <div>\n        <br />\n    </div>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}</p>\n    <p></p>\n    <p></p>', 'user', 1),
(2, NULL, 'Agent Reply To The Customer\'s ticket', 'New Reply Added on ticket #{% ticket.id %}', '    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center\">{%global.companyLogo%}</p>\n    <p style=\"text-align: center\">\n        <br>\n    </p>\n    <p style=\"text-align: center\">\n        <span style=\"font-size: 18px\">\n            <b style=\"font-weight:bold\">New Response!!</b>\n        </span>\n    </p>\n    <span style=\"font-size: 18px\">\n        <b style=\"font-weight:bold\"> </b>\n    </span>\n    <p>\n        <br>\n    </p>\n    <p></p>\n    <p></p> Hello {%ticket.customerName%},\n    <p></p>\n    <p></p>\n    <p>\n        <span style=\"line-height: 1.42857\">\n            <br>\n        </span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857\">A reply has been added by the </span>{%ticket.agentName%} on your ticket {%ticket.id%}. Kindly follow this link {%ticket.customerLink%}\n        to get the insight of the message.\n        <span style=\"line-height: 1.42857\"> </span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857\">\n            <br>\n        </span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857\">Here go the ticket message:</span>\n    </p>\n    <p>{%ticket.threadMessage%}{%ticket.attachments%}\n        <br>\n    </p>\n    <p></p>\n    <p></p>\n    <p>\n        <br>\n    </p>\n    <p></p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}\n        <br>\n    </p>\n    <br>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>', 'ticket', 1),
(3, NULL, 'Ticket generated by customer', 'A new ticket #{%ticket.id%} has been generated by {%ticket.customerName%}', '<p></p>\n<p></p>\n<p style=\"text-align: center; \">{%global.companyLogo%}</p>\n<p style=\"text-align: center; \">\n    <br />\n</p>\n<p style=\"text-align: center; \">\n    <b>\n        <span style=\"font-size: 18px;\">Ticket generated!!</span>\n    </b>\n</p>\n<br />Hello {%ticket.agentName%},\n<p></p>\n<p>\n    <br />\n</p>\n<p>A new ticket {%ticket.id%} has been generated by {%ticket.customerName%} from the id {%ticket.customerEmail%}. Hit on the link provided so that you can have the access to the ticket {%ticket.agentLink%}.</p>\n<p>\n    <br />\n</p>\n<p>Here goes the ticket message:</p>\n<p>{%ticket.message%}\n    <br />\n</p>\n<p>\n    <br />\n</p>\n<p>\n    <br />\n</p> Thanks and Regards\n<p></p>\n<p>{%global.companyName%}\n    <br />\n</p>\n<p></p>\n<p></p>', 'ticket', 1),
(4, NULL, 'Agent Account Created', 'Welcome to {%global.companyName%} Helpdesk Support System', '    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <span style=\"font-size: 18px;\">\n            <b>Thank you for joining!!</b>\n        </span>\n    </p>\n    <p style=\"text-align: center; \">\n        <i>\n            <br />\n        </i>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Hello&nbsp;{%user.userName%},</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Your account has been successfully created.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\"\n        align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">Click on the link to set your password </span>{%user.accountValidationLink%}\n        <span style=\"line-height: 100%;\">&nbsp;and get started with the </span>{%global.companyName%}\n        <span style=\"line-height: 100%;\">&nbsp;services.</span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">\n            <br />\n        </span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Thanks and Regards\n        <br />\n    </p>\n    <p>{%global.companyName%}</p>\n    <p>\n        <br />\n    </p>\n    <p></p>', 'user', 1),
(5, NULL, 'Ticket Assign', 'Ticket #{% ticket.id %} assign to you', '    <p></p>\n    <p style=\"text-align: center;\">{%global.companyLogo%}</p>\n    <p style=\"text-align: center;\">\n        <br />\n    </p>\n    <p style=\"text-align: center;\">\n        <b>\n            <span style=\"font-size: 18px;\">Ticket assigned- Get ready!!</span>\n        </b>\n    </p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p> Hello&nbsp;{%ticket.agentName%},\n    <br />\n    <br />\n    <p></p>\n    <p>A ticket&nbsp;{%ticket.id%} has been assigned to you. You are requested to follow this link&nbsp;{%ticket.agentLink%} to get the\n        access of the ticket.</p>\n    <p>\n        <br />\n    </p>\n    <p>Here go the ticket message:</p>\n    <p>{%ticket.message%}\n        <br />\n    </p>\n    <p>\n        <br />\n    </p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}\n        <br />\n    </p>\n    <p></p>\n    <p>\n        <br />\n    </p>\n    <p></p>\n    <p>\n        <br />\n    </p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>', 'ticket', 1),
(6, NULL, 'Customer Reply To The Agent', 'Customer Reply Ticket #{% ticket.id %}', '    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p>\n    <p style=\"text-align: center; \">\n        <b>\n            <span style=\"font-size: 18px;\">New Response!!</span>\n        </b>\n    </p>\n    <p style=\"text-align: center; \">\n        <b>\n            <span style=\"font-size: 18px;\">\n                <br />\n            </span>\n        </b>\n    </p> Hello {%ticket.agentName%},</p>\n    <p></p>\n    <p>\n        <br />\n    </p>\n    <p></p>\n    <p></p>\n    <p>\n        <span style=\"line-height: 1.42857143;\">New reply have been added to ticket #{%ticket.id%} you can login to ticket system through this link&nbsp;{%ticket.agentLink%}.</span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857143;\">&nbsp;</span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857143;\">Customer reply:\n            <br />\n        </span>{%ticket.threadMessage%}{%ticket.attachments%}</p>\n    <p>\n        <br />\n    </p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}\n        <br />\n    </p>\n    <p>\n        <br />\n    </p>\n    <p></p>', 'ticket', 1),
(7, NULL, 'Ticket generated success mail to customer', 'New ticket #{% ticket.id %} Received', '<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p style=\"text-align: center;\">{%global.companyLogo%}</p>\n<p style=\"text-align: center;\">\n    <br />\n</p>\n<p style=\"text-align: center;\">\n    <b>\n        <span style=\"font-size: 18px;\">Ticket generated!!</span>\n    </b>\n</p>\n<p style=\"text-align: center; \">\n    <br />\n</p>\n<br />\n<p></p>\n<p>Hello&nbsp;{%ticket.customerName%},</p>\n<p>\n    <br />\n</p>\n<p></p>\n<p>Thank you so much for taking the time to connect us!</p>\n<p>\n    <br />\n</p>\n<p>Your ticket #{%ticket.id%} has been received. You can check ticket through this link {%ticket.customerLink%} and you can also reply via this email.</p>\n<p>\n<p>\n    <br />\n</p>\n<p>Our support staff will get back to you shortly (it might take a bit longer on evenings and weekends). Feel free to ask for any support request we will be happy to help.</p>\n<p>\n    <span style=\"line-height: 1.42857143;\">\n        <br />\n    </span>\n</p>\n<p>Thanks and Regards</p>\n<p>{%global.companyName%}\n    <br />\n</p>\n<br />\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>', 'ticket', 1),
(8, NULL, 'Customer Account Created', 'Welcome to {%global.companyName%} Helpdesk', '    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p>\n    <p style=\"text-align: center; \">\n        <span style=\"font-size: 18px;\">\n            <b>Thank you for joining!!</b>\n        </span>\n    </p>\n    <p style=\"text-align: center; \">\n        <i>\n            <br />\n        </i>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Hello&nbsp;{%user.userName%},</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Your account has been successfully created. We welcome&nbsp;you to the community of&nbsp;{%global.companyName%}.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\"\n        align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">It is our privilege to have you as our customer. We are pretty much sure that you will love the fact that how simple it is\n        to get started with the services. We are dedicated to making your working life simpler.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\"\n        align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">Click on the link to set your password </span>{%user.accountValidationLink%}\n        <span style=\"line-height: 100%;\">&nbsp;and get started with the </span>{%global.companyName%}\n        <span style=\"line-height: 100%;\">&nbsp;services.</span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">\n            <br />\n        </span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Hoping that you will enjoy this experience.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Thanks and Regards\n        <br />\n    </p>\n    <p>{%global.companyName%}</p>\n    <p>\n        <br />\n    </p>\n    <p></p>', 'user', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_lead_support_teams`
--

CREATE TABLE `uv_lead_support_teams` (
  `leadUserInstanceId` int(11) NOT NULL,
  `supportTeamId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_prepared_responses`
--

CREATE TABLE `uv_prepared_responses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `actions` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `status` tinyint(1) DEFAULT 1,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_prepared_response_support_groups`
--

CREATE TABLE `uv_prepared_response_support_groups` (
  `group_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_prepared_response_support_teams`
--

CREATE TABLE `uv_prepared_response_support_teams` (
  `subgroup_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_related_articles`
--

CREATE TABLE `uv_related_articles` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `related_article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_saved_filters`
--

CREATE TABLE `uv_saved_filters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtering` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_saved_replies`
--

CREATE TABLE `uv_saved_replies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `is_predefind` tinyint(1) DEFAULT 1,
  `message_inline` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_for` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_saved_replies_groups`
--

CREATE TABLE `uv_saved_replies_groups` (
  `group_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_saved_replies_teams`
--

CREATE TABLE `uv_saved_replies_teams` (
  `subgroup_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_solutions`
--

CREATE TABLE `uv_solutions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 5,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `solution_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_solution_category`
--

CREATE TABLE `uv_solution_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT 1,
  `sorting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'ascending',
  `date_added` datetime NOT NULL,
  `status` int(11) DEFAULT 0,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_solution_category_mapping`
--

CREATE TABLE `uv_solution_category_mapping` (
  `id` int(11) NOT NULL,
  `solution_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_support_group`
--

CREATE TABLE `uv_support_group` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `user_view` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_support_group`
--

INSERT INTO `uv_support_group` (`id`, `name`, `description`, `created_at`, `is_active`, `user_view`) VALUES
(1, 'Default', 'Account Owner', '2021-09-21 23:36:27', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_support_groups_teams`
--

CREATE TABLE `uv_support_groups_teams` (
  `supportGroup_id` int(11) NOT NULL,
  `supportTeam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_support_label`
--

CREATE TABLE `uv_support_label` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_support_privilege`
--

CREATE TABLE `uv_support_privilege` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `privileges` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_support_privilege`
--

INSERT INTO `uv_support_privilege` (`id`, `name`, `description`, `privileges`, `created_at`) VALUES
(1, 'Default Privileges', 'Default Privileges', 'a:1:{i:0;s:19:\"ROLE_AGENT_ADD_NOTE\";}', '2021-09-21 23:36:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_support_role`
--

CREATE TABLE `uv_support_role` (
  `id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_support_role`
--

INSERT INTO `uv_support_role` (`id`, `code`, `description`) VALUES
(1, 'ROLE_SUPER_ADMIN', 'Account Owner'),
(2, 'ROLE_ADMIN', 'Administrator'),
(3, 'ROLE_AGENT', 'Agent'),
(4, 'ROLE_CUSTOMER', 'Customer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_support_team`
--

CREATE TABLE `uv_support_team` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_tag`
--

CREATE TABLE `uv_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_thread`
--

CREATE TABLE `uv_thread` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thread_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `bcc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `reply_to` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `is_bookmarked` tinyint(1) NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `agent_viewed_at` datetime DEFAULT NULL,
  `customer_viewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_ticket`
--

CREATE TABLE `uv_ticket` (
  `id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_ids` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT 1,
  `is_replied` tinyint(1) NOT NULL DEFAULT 0,
  `is_reply_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `is_starred` tinyint(1) NOT NULL DEFAULT 0,
  `is_trashed` tinyint(1) NOT NULL DEFAULT 0,
  `is_agent_viewed` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer_viewed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subGroup_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_tickets_collaborators`
--

CREATE TABLE `uv_tickets_collaborators` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_tickets_labels`
--

CREATE TABLE `uv_tickets_labels` (
  `ticket_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_tickets_tags`
--

CREATE TABLE `uv_tickets_tags` (
  `ticket_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_ticket_attachments`
--

CREATE TABLE `uv_ticket_attachments` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `content_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_system` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_ticket_priority`
--

CREATE TABLE `uv_ticket_priority` (
  `id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_ticket_priority`
--

INSERT INTO `uv_ticket_priority` (`id`, `code`, `description`, `color_code`) VALUES
(1, 'low', 'Low', '#2DD051'),
(2, 'medium', 'Medium', '#F5D02A'),
(3, 'high', 'High', '#FA8B3C'),
(4, 'urgent', 'Urgent', '#FF6565');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_ticket_rating`
--

CREATE TABLE `uv_ticket_rating` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stars` int(11) NOT NULL DEFAULT 0,
  `feedback` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_ticket_status`
--

CREATE TABLE `uv_ticket_status` (
  `id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_ticket_status`
--

INSERT INTO `uv_ticket_status` (`id`, `code`, `description`, `color_code`, `sort_order`) VALUES
(1, 'open', 'Open', '#7E91F0', 1),
(2, 'pending', 'Pending', '#FF6A6B', 2),
(3, 'answered', 'Answered', '#FFDE00', 3),
(4, 'resolved', 'Resolved', '#2CD651', 4),
(5, 'closed', 'Closed', '#767676', 5),
(6, 'spam', 'Spam', '#00A1F2', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_ticket_type`
--

CREATE TABLE `uv_ticket_type` (
  `id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_ticket_type`
--

INSERT INTO `uv_ticket_type` (`id`, `code`, `description`, `is_active`) VALUES
(1, 'support', 'Support', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_user`
--

CREATE TABLE `uv_user` (
  `id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proxy_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeformat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_user`
--

INSERT INTO `uv_user` (`id`, `email`, `proxy_id`, `password`, `first_name`, `last_name`, `is_enabled`, `verification_code`, `timezone`, `timeformat`) VALUES
(1, 'maguilar@groupthree.com', NULL, '$argon2id$v=19$m=65536,t=4,p=1$UFliQjBCVVRLU3cxRFVLTQ$IBgMsCLu7YMcjLRsWPXG1dv3wDaPotMgHw5w/Cl+uq0', 'groupthree', '', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_user_instance`
--

CREATE TABLE `uv_user_instance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skype_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image_path` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_starred` tinyint(1) NOT NULL DEFAULT 0,
  `ticket_access_level` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supportRole_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_user_instance`
--

INSERT INTO `uv_user_instance` (`id`, `user_id`, `source`, `skype_id`, `contact_number`, `designation`, `signature`, `profile_image_path`, `created_at`, `updated_at`, `is_active`, `is_verified`, `is_starred`, `ticket_access_level`, `supportRole_id`) VALUES
(1, 1, 'website', NULL, NULL, NULL, NULL, NULL, '2021-09-21 23:36:31', '2021-09-21 23:36:31', 1, 1, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_user_support_groups`
--

CREATE TABLE `uv_user_support_groups` (
  `userInstanceId` int(11) NOT NULL,
  `supportGroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_user_support_privileges`
--

CREATE TABLE `uv_user_support_privileges` (
  `userInstanceId` int(11) NOT NULL,
  `supportPrivilegeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_user_support_teams`
--

CREATE TABLE `uv_user_support_teams` (
  `userInstanceId` int(11) NOT NULL,
  `supportTeamId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_website`
--

CREATE TABLE `uv_website` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeformat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_website`
--

INSERT INTO `uv_website` (`id`, `name`, `code`, `logo`, `theme_color`, `favicon`, `created_at`, `updated_at`, `is_active`, `timezone`, `timeformat`) VALUES
(1, 'Support Center', 'helpdesk', NULL, '#7E91F0', NULL, '2021-09-21 23:36:28', '2021-09-21 23:36:28', NULL, NULL, NULL),
(2, 'Knowledgebase', 'knowledgebase', NULL, '#7E91F0', NULL, '2021-09-21 23:36:28', '2021-09-21 23:36:28', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_website_knowledgebase`
--

CREATE TABLE `uv_website_knowledgebase` (
  `id` int(11) NOT NULL,
  `website` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_background_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_create_option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `white_list` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `black_list` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `broadcast_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable_customer_login` tinyint(1) NOT NULL,
  `script` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `header_links` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `footer_links` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `banner_background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_hover_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_required_to_create` tinyint(1) DEFAULT NULL,
  `remove_customer_login_button` int(11) DEFAULT 0,
  `remove_branding_content` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_website_knowledgebase`
--

INSERT INTO `uv_website_knowledgebase` (`id`, `website`, `status`, `brand_color`, `page_background_color`, `header_background_color`, `link_color`, `article_text_color`, `ticket_create_option`, `site_description`, `meta_description`, `meta_keywords`, `homepage_content`, `white_list`, `black_list`, `created_at`, `updated_at`, `broadcast_message`, `disable_customer_login`, `script`, `custom_css`, `is_active`, `header_links`, `footer_links`, `banner_background_color`, `link_hover_color`, `login_required_to_create`, `remove_customer_login_button`, `remove_branding_content`) VALUES
(1, 2, '1', '#7E91F0', '#FFFFFF', '#FFFFFF', '#2750C4', '#333333', '1', 'Hi! how can i help you.', NULL, NULL, 'masonry', NULL, NULL, '2021-09-21 23:36:29', '2021-09-21 23:36:29', NULL, 0, NULL, NULL, 1, 'N;', 'N;', '#7C70F4', '#2750C4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_workflow`
--

CREATE TABLE `uv_workflow` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conditions` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `actions` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `sort_order` int(11) DEFAULT NULL,
  `is_predefind` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_workflow`
--

INSERT INTO `uv_workflow` (`id`, `name`, `description`, `conditions`, `actions`, `sort_order`, `is_predefind`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Customer Created', 'Send customer a welcome email after their account has been created.', 'a:0:{}', 'a:1:{i:2;a:2:{s:4:\"type\";s:29:\"uvdesk.customer.mail_customer\";s:5:\"value\";s:1:\"8\";}}', 1, 1, 1, '2021-09-21 23:36:28', '2021-09-21 23:36:28'),
(2, 'Agent Created', 'Send agent a welcome email when their account is created.', 'a:0:{}', 'a:1:{i:0;a:2:{s:4:\"type\";s:23:\"uvdesk.agent.mail_agent\";s:5:\"value\";s:1:\"4\";}}', 2, 1, 1, '2021-09-21 23:36:28', '2021-09-21 23:36:28'),
(3, 'User Forgot Password', 'Send an email to user with a link to reset their password.', 'a:0:{}', 'a:1:{i:1;a:2:{s:4:\"type\";s:21:\"uvdesk.user.mail_user\";s:5:\"value\";s:1:\"1\";}}', 2, 1, 1, '2021-09-21 23:36:28', '2021-09-21 23:36:28'),
(4, 'Ticket Agent Update - Mail to Agent', 'Send an email to updated agent on ticket', 'a:0:{}', 'a:1:{i:1;a:2:{s:4:\"type\";s:24:\"uvdesk.ticket.mail_agent\";s:5:\"value\";a:2:{s:3:\"for\";a:1:{i:0;s:13:\"assignedAgent\";}s:5:\"value\";s:1:\"5\";}}}', 3, 1, 1, '2021-09-21 23:36:28', '2021-09-21 23:36:28'),
(5, 'Ticket Created', 'Automate actions when ticket is created.', 'a:0:{}', 'a:3:{i:0;a:2:{s:4:\"type\";s:27:\"uvdesk.ticket.mail_customer\";s:5:\"value\";s:1:\"7\";}i:1;a:2:{s:4:\"type\";s:26:\"uvdesk.ticket.assign_agent\";s:5:\"value\";s:18:\"responsePerforming\";}i:2;a:2:{s:4:\"type\";s:24:\"uvdesk.ticket.mail_agent\";s:5:\"value\";a:2:{s:3:\"for\";a:2:{i:0;s:13:\"assignedAgent\";i:1;s:1:\"5\";}s:5:\"value\";s:1:\"3\";}}}', 4, 1, 1, '2021-09-21 23:36:28', '2021-09-21 23:36:28'),
(6, 'Agent Replied on Ticket', 'Send customer an email when reply is added on ticket.', 'a:0:{}', 'a:1:{i:0;a:2:{s:4:\"type\";s:27:\"uvdesk.ticket.mail_customer\";s:5:\"value\";s:1:\"2\";}}', 5, 1, 1, '2021-09-21 23:36:28', '2021-09-21 23:36:28'),
(7, 'Customer Replied on Ticket', 'Send agent an email when reply is added on ticket.', 'a:0:{}', 'a:1:{i:0;a:2:{s:4:\"type\";s:24:\"uvdesk.ticket.mail_agent\";s:5:\"value\";a:2:{s:3:\"for\";a:1:{i:0;s:13:\"assignedAgent\";}s:5:\"value\";s:1:\"6\";}}}', 6, 1, 1, '2021-09-21 23:36:28', '2021-09-21 23:36:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uv_workflow_events`
--

CREATE TABLE `uv_workflow_events` (
  `id` int(11) NOT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uv_workflow_events`
--

INSERT INTO `uv_workflow_events` (`id`, `workflow_id`, `event_id`, `event`) VALUES
(1, 1, 1, 'uvdesk.customer.created'),
(2, 2, 2, 'uvdesk.agent.created'),
(3, 3, 3, 'uvdesk.user.forgot_password'),
(4, 4, 4, 'uvdesk.ticket.agent_updated'),
(5, 5, 5, 'uvdesk.ticket.created'),
(6, 6, 6, 'uvdesk.ticket.agent_reply'),
(7, 7, 7, 'uvdesk.ticket.customer_reply');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agent_activity`
--
ALTER TABLE `agent_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9AA510CE3414710B` (`agent_id`),
  ADD KEY `IDX_9AA510CE700047D2` (`ticket_id`);

--
-- Indices de la tabla `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4DB9D91CFE54D947` (`group_id`);

--
-- Indices de la tabla `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `recaptcha`
--
ALTER TABLE `recaptcha`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_admin_support_groups`
--
ALTER TABLE `uv_admin_support_groups`
  ADD PRIMARY KEY (`adminUserInstanceId`,`supportGroupId`),
  ADD KEY `IDX_215FF93837B7A2F1` (`adminUserInstanceId`),
  ADD KEY `IDX_215FF93853F5B65F` (`supportGroupId`);

--
-- Indices de la tabla `uv_article`
--
ALTER TABLE `uv_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_idx` (`slug`);

--
-- Indices de la tabla `uv_article_category`
--
ALTER TABLE `uv_article_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_article_feedback`
--
ALTER TABLE `uv_article_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BCB7F9147294869C` (`article_id`),
  ADD KEY `IDX_BCB7F914A76ED395` (`user_id`);

--
-- Indices de la tabla `uv_article_history`
--
ALTER TABLE `uv_article_history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_article_tags`
--
ALTER TABLE `uv_article_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_article_view_log`
--
ALTER TABLE `uv_article_view_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8F76FF11A76ED395` (`user_id`),
  ADD KEY `IDX_8F76FF117294869C` (`article_id`);

--
-- Indices de la tabla `uv_email_templates`
--
ALTER TABLE `uv_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_784A0D85A76ED395` (`user_id`);

--
-- Indices de la tabla `uv_lead_support_teams`
--
ALTER TABLE `uv_lead_support_teams`
  ADD PRIMARY KEY (`leadUserInstanceId`,`supportTeamId`),
  ADD KEY `IDX_8B5F844DD397BD7C` (`leadUserInstanceId`),
  ADD KEY `IDX_8B5F844DA77C7023` (`supportTeamId`);

--
-- Indices de la tabla `uv_prepared_responses`
--
ALTER TABLE `uv_prepared_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8AB5F066A76ED395` (`user_id`);

--
-- Indices de la tabla `uv_prepared_response_support_groups`
--
ALTER TABLE `uv_prepared_response_support_groups`
  ADD PRIMARY KEY (`savedReply_id`,`group_id`),
  ADD KEY `IDX_A22590198D3102C3` (`savedReply_id`),
  ADD KEY `IDX_A2259019FE54D947` (`group_id`);

--
-- Indices de la tabla `uv_prepared_response_support_teams`
--
ALTER TABLE `uv_prepared_response_support_teams`
  ADD PRIMARY KEY (`savedReply_id`,`subgroup_id`),
  ADD KEY `IDX_B6897DEB8D3102C3` (`savedReply_id`),
  ADD KEY `IDX_B6897DEBF5C464CE` (`subgroup_id`);

--
-- Indices de la tabla `uv_related_articles`
--
ALTER TABLE `uv_related_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_saved_filters`
--
ALTER TABLE `uv_saved_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E1BFBAF7A76ED395` (`user_id`);

--
-- Indices de la tabla `uv_saved_replies`
--
ALTER TABLE `uv_saved_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_39C8BA50A76ED395` (`user_id`);

--
-- Indices de la tabla `uv_saved_replies_groups`
--
ALTER TABLE `uv_saved_replies_groups`
  ADD PRIMARY KEY (`savedReply_id`,`group_id`),
  ADD KEY `IDX_C59C13668D3102C3` (`savedReply_id`),
  ADD KEY `IDX_C59C1366FE54D947` (`group_id`);

--
-- Indices de la tabla `uv_saved_replies_teams`
--
ALTER TABLE `uv_saved_replies_teams`
  ADD PRIMARY KEY (`savedReply_id`,`subgroup_id`),
  ADD KEY `IDX_D240CE708D3102C3` (`savedReply_id`),
  ADD KEY `IDX_D240CE70F5C464CE` (`subgroup_id`);

--
-- Indices de la tabla `uv_solutions`
--
ALTER TABLE `uv_solutions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_solution_category`
--
ALTER TABLE `uv_solution_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_solution_category_mapping`
--
ALTER TABLE `uv_solution_category_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_support_group`
--
ALTER TABLE `uv_support_group`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_support_groups_teams`
--
ALTER TABLE `uv_support_groups_teams`
  ADD PRIMARY KEY (`supportGroup_id`,`supportTeam_id`),
  ADD KEY `IDX_761A315DCE5F5290` (`supportGroup_id`),
  ADD KEY `IDX_761A315D9718E641` (`supportTeam_id`);

--
-- Indices de la tabla `uv_support_label`
--
ALTER TABLE `uv_support_label`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EFD454DDA76ED395` (`user_id`);

--
-- Indices de la tabla `uv_support_privilege`
--
ALTER TABLE `uv_support_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_support_role`
--
ALTER TABLE `uv_support_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A72177153098` (`code`);

--
-- Indices de la tabla `uv_support_team`
--
ALTER TABLE `uv_support_team`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_tag`
--
ALTER TABLE `uv_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_thread`
--
ALTER TABLE `uv_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_637D7E5D700047D2` (`ticket_id`),
  ADD KEY `IDX_637D7E5DA76ED395` (`user_id`);

--
-- Indices de la tabla `uv_ticket`
--
ALTER TABLE `uv_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C5FD9F7D6BF700BD` (`status_id`),
  ADD KEY `IDX_C5FD9F7D497B19F9` (`priority_id`),
  ADD KEY `IDX_C5FD9F7DC54C8C93` (`type_id`),
  ADD KEY `IDX_C5FD9F7D9395C3F3` (`customer_id`),
  ADD KEY `IDX_C5FD9F7D3414710B` (`agent_id`),
  ADD KEY `IDX_C5FD9F7DFE54D947` (`group_id`),
  ADD KEY `IDX_C5FD9F7DCB20698` (`subGroup_id`);

--
-- Indices de la tabla `uv_tickets_collaborators`
--
ALTER TABLE `uv_tickets_collaborators`
  ADD PRIMARY KEY (`ticket_id`,`user_id`),
  ADD KEY `IDX_20764CBA700047D2` (`ticket_id`),
  ADD KEY `IDX_20764CBAA76ED395` (`user_id`);

--
-- Indices de la tabla `uv_tickets_labels`
--
ALTER TABLE `uv_tickets_labels`
  ADD PRIMARY KEY (`ticket_id`,`label_id`),
  ADD KEY `IDX_305F9C0E700047D2` (`ticket_id`),
  ADD KEY `IDX_305F9C0E33B92F39` (`label_id`);

--
-- Indices de la tabla `uv_tickets_tags`
--
ALTER TABLE `uv_tickets_tags`
  ADD PRIMARY KEY (`ticket_id`,`tag_id`),
  ADD KEY `IDX_CF4DF9E3700047D2` (`ticket_id`),
  ADD KEY `IDX_CF4DF9E3BAD26311` (`tag_id`);

--
-- Indices de la tabla `uv_ticket_attachments`
--
ALTER TABLE `uv_ticket_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FE918C8EE2904019` (`thread_id`);

--
-- Indices de la tabla `uv_ticket_priority`
--
ALTER TABLE `uv_ticket_priority`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FFA6CF8677153098` (`code`);

--
-- Indices de la tabla `uv_ticket_rating`
--
ALTER TABLE `uv_ticket_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B1025E04700047D2` (`ticket_id`),
  ADD KEY `IDX_B1025E04A76ED395` (`user_id`);

--
-- Indices de la tabla `uv_ticket_status`
--
ALTER TABLE `uv_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_128B1D3A77153098` (`code`);

--
-- Indices de la tabla `uv_ticket_type`
--
ALTER TABLE `uv_ticket_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3E0B313677153098` (`code`);

--
-- Indices de la tabla `uv_user`
--
ALTER TABLE `uv_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E8D39F61E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_E8D39F61DB26A4E` (`proxy_id`),
  ADD UNIQUE KEY `UNIQ_E8D39F61E821C39F` (`verification_code`);

--
-- Indices de la tabla `uv_user_instance`
--
ALTER TABLE `uv_user_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B1744733A76ED395` (`user_id`),
  ADD KEY `IDX_B174473368771C43` (`supportRole_id`);

--
-- Indices de la tabla `uv_user_support_groups`
--
ALTER TABLE `uv_user_support_groups`
  ADD PRIMARY KEY (`userInstanceId`,`supportGroupId`),
  ADD KEY `IDX_B6CD76C28B414560` (`userInstanceId`),
  ADD KEY `IDX_B6CD76C253F5B65F` (`supportGroupId`);

--
-- Indices de la tabla `uv_user_support_privileges`
--
ALTER TABLE `uv_user_support_privileges`
  ADD PRIMARY KEY (`userInstanceId`,`supportPrivilegeId`),
  ADD KEY `IDX_9550EDB28B414560` (`userInstanceId`),
  ADD KEY `IDX_9550EDB289C60B89` (`supportPrivilegeId`);

--
-- Indices de la tabla `uv_user_support_teams`
--
ALTER TABLE `uv_user_support_teams`
  ADD PRIMARY KEY (`userInstanceId`,`supportTeamId`),
  ADD KEY `IDX_5F33E9F78B414560` (`userInstanceId`),
  ADD KEY `IDX_5F33E9F7A77C7023` (`supportTeamId`);

--
-- Indices de la tabla `uv_website`
--
ALTER TABLE `uv_website`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2656FF0677153098` (`code`);

--
-- Indices de la tabla `uv_website_knowledgebase`
--
ALTER TABLE `uv_website_knowledgebase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DFF10F0B476F5DE7` (`website`);

--
-- Indices de la tabla `uv_workflow`
--
ALTER TABLE `uv_workflow`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uv_workflow_events`
--
ALTER TABLE `uv_workflow_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6AEB02A92C7C2CBA` (`workflow_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agent_activity`
--
ALTER TABLE `agent_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recaptcha`
--
ALTER TABLE `recaptcha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_article`
--
ALTER TABLE `uv_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_article_category`
--
ALTER TABLE `uv_article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_article_feedback`
--
ALTER TABLE `uv_article_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_article_history`
--
ALTER TABLE `uv_article_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_article_tags`
--
ALTER TABLE `uv_article_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_article_view_log`
--
ALTER TABLE `uv_article_view_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_email_templates`
--
ALTER TABLE `uv_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `uv_prepared_responses`
--
ALTER TABLE `uv_prepared_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_related_articles`
--
ALTER TABLE `uv_related_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_saved_filters`
--
ALTER TABLE `uv_saved_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_saved_replies`
--
ALTER TABLE `uv_saved_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_solutions`
--
ALTER TABLE `uv_solutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_solution_category`
--
ALTER TABLE `uv_solution_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_solution_category_mapping`
--
ALTER TABLE `uv_solution_category_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_support_group`
--
ALTER TABLE `uv_support_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uv_support_label`
--
ALTER TABLE `uv_support_label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_support_privilege`
--
ALTER TABLE `uv_support_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uv_support_role`
--
ALTER TABLE `uv_support_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `uv_support_team`
--
ALTER TABLE `uv_support_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_tag`
--
ALTER TABLE `uv_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_thread`
--
ALTER TABLE `uv_thread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_ticket`
--
ALTER TABLE `uv_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_ticket_attachments`
--
ALTER TABLE `uv_ticket_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_ticket_priority`
--
ALTER TABLE `uv_ticket_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `uv_ticket_rating`
--
ALTER TABLE `uv_ticket_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uv_ticket_status`
--
ALTER TABLE `uv_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `uv_ticket_type`
--
ALTER TABLE `uv_ticket_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uv_user`
--
ALTER TABLE `uv_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uv_user_instance`
--
ALTER TABLE `uv_user_instance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uv_website`
--
ALTER TABLE `uv_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `uv_website_knowledgebase`
--
ALTER TABLE `uv_website_knowledgebase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uv_workflow`
--
ALTER TABLE `uv_workflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `uv_workflow_events`
--
ALTER TABLE `uv_workflow_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agent_activity`
--
ALTER TABLE `agent_activity`
  ADD CONSTRAINT `FK_9AA510CE3414710B` FOREIGN KEY (`agent_id`) REFERENCES `uv_user` (`id`),
  ADD CONSTRAINT `FK_9AA510CE700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `FK_4DB9D91CFE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`);

--
-- Filtros para la tabla `uv_admin_support_groups`
--
ALTER TABLE `uv_admin_support_groups`
  ADD CONSTRAINT `FK_215FF93837B7A2F1` FOREIGN KEY (`adminUserInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_215FF93853F5B65F` FOREIGN KEY (`supportGroupId`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_article_feedback`
--
ALTER TABLE `uv_article_feedback`
  ADD CONSTRAINT `FK_BCB7F9147294869C` FOREIGN KEY (`article_id`) REFERENCES `uv_article` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BCB7F914A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_article_view_log`
--
ALTER TABLE `uv_article_view_log`
  ADD CONSTRAINT `FK_8F76FF117294869C` FOREIGN KEY (`article_id`) REFERENCES `uv_article` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8F76FF11A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_email_templates`
--
ALTER TABLE `uv_email_templates`
  ADD CONSTRAINT `FK_784A0D85A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_lead_support_teams`
--
ALTER TABLE `uv_lead_support_teams`
  ADD CONSTRAINT `FK_8B5F844DA77C7023` FOREIGN KEY (`supportTeamId`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8B5F844DD397BD7C` FOREIGN KEY (`leadUserInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_prepared_responses`
--
ALTER TABLE `uv_prepared_responses`
  ADD CONSTRAINT `FK_8AB5F066A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `uv_prepared_response_support_groups`
--
ALTER TABLE `uv_prepared_response_support_groups`
  ADD CONSTRAINT `FK_A22590198D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_prepared_responses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A2259019FE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_prepared_response_support_teams`
--
ALTER TABLE `uv_prepared_response_support_teams`
  ADD CONSTRAINT `FK_B6897DEB8D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_prepared_responses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B6897DEBF5C464CE` FOREIGN KEY (`subgroup_id`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_saved_filters`
--
ALTER TABLE `uv_saved_filters`
  ADD CONSTRAINT `FK_E1BFBAF7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_saved_replies`
--
ALTER TABLE `uv_saved_replies`
  ADD CONSTRAINT `FK_39C8BA50A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_saved_replies_groups`
--
ALTER TABLE `uv_saved_replies_groups`
  ADD CONSTRAINT `FK_C59C13668D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_saved_replies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C59C1366FE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_saved_replies_teams`
--
ALTER TABLE `uv_saved_replies_teams`
  ADD CONSTRAINT `FK_D240CE708D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_saved_replies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D240CE70F5C464CE` FOREIGN KEY (`subgroup_id`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_support_groups_teams`
--
ALTER TABLE `uv_support_groups_teams`
  ADD CONSTRAINT `FK_761A315D9718E641` FOREIGN KEY (`supportTeam_id`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_761A315DCE5F5290` FOREIGN KEY (`supportGroup_id`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_support_label`
--
ALTER TABLE `uv_support_label`
  ADD CONSTRAINT `FK_EFD454DDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_thread`
--
ALTER TABLE `uv_thread`
  ADD CONSTRAINT `FK_637D7E5D700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_637D7E5DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `uv_ticket`
--
ALTER TABLE `uv_ticket`
  ADD CONSTRAINT `FK_C5FD9F7D3414710B` FOREIGN KEY (`agent_id`) REFERENCES `uv_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C5FD9F7D497B19F9` FOREIGN KEY (`priority_id`) REFERENCES `uv_ticket_priority` (`id`),
  ADD CONSTRAINT `FK_C5FD9F7D6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `uv_ticket_status` (`id`),
  ADD CONSTRAINT `FK_C5FD9F7D9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C5FD9F7DC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `uv_ticket_type` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C5FD9F7DCB20698` FOREIGN KEY (`subGroup_id`) REFERENCES `uv_support_team` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C5FD9F7DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `uv_tickets_collaborators`
--
ALTER TABLE `uv_tickets_collaborators`
  ADD CONSTRAINT `FK_20764CBA700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_20764CBAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_tickets_labels`
--
ALTER TABLE `uv_tickets_labels`
  ADD CONSTRAINT `FK_305F9C0E33B92F39` FOREIGN KEY (`label_id`) REFERENCES `uv_support_label` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_305F9C0E700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_tickets_tags`
--
ALTER TABLE `uv_tickets_tags`
  ADD CONSTRAINT `FK_CF4DF9E3700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CF4DF9E3BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `uv_tag` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_ticket_attachments`
--
ALTER TABLE `uv_ticket_attachments`
  ADD CONSTRAINT `FK_FE918C8EE2904019` FOREIGN KEY (`thread_id`) REFERENCES `uv_thread` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_ticket_rating`
--
ALTER TABLE `uv_ticket_rating`
  ADD CONSTRAINT `FK_B1025E04700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B1025E04A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_user_instance`
--
ALTER TABLE `uv_user_instance`
  ADD CONSTRAINT `FK_B174473368771C43` FOREIGN KEY (`supportRole_id`) REFERENCES `uv_support_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B1744733A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_user_support_groups`
--
ALTER TABLE `uv_user_support_groups`
  ADD CONSTRAINT `FK_B6CD76C253F5B65F` FOREIGN KEY (`supportGroupId`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B6CD76C28B414560` FOREIGN KEY (`userInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_user_support_privileges`
--
ALTER TABLE `uv_user_support_privileges`
  ADD CONSTRAINT `FK_9550EDB289C60B89` FOREIGN KEY (`supportPrivilegeId`) REFERENCES `uv_support_privilege` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9550EDB28B414560` FOREIGN KEY (`userInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_user_support_teams`
--
ALTER TABLE `uv_user_support_teams`
  ADD CONSTRAINT `FK_5F33E9F78B414560` FOREIGN KEY (`userInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5F33E9F7A77C7023` FOREIGN KEY (`supportTeamId`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uv_website_knowledgebase`
--
ALTER TABLE `uv_website_knowledgebase`
  ADD CONSTRAINT `FK_DFF10F0B476F5DE7` FOREIGN KEY (`website`) REFERENCES `uv_website` (`id`);

--
-- Filtros para la tabla `uv_workflow_events`
--
ALTER TABLE `uv_workflow_events`
  ADD CONSTRAINT `FK_6AEB02A92C7C2CBA` FOREIGN KEY (`workflow_id`) REFERENCES `uv_workflow` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
