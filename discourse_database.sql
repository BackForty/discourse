--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE api_keys (
    id integer NOT NULL,
    key character varying(64) NOT NULL,
    user_id integer,
    created_by_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.api_keys OWNER TO jamie;

--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_keys_id_seq OWNER TO jamie;

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- Name: badge_types; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE badge_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    color_hexcode character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.badge_types OWNER TO jamie;

--
-- Name: badge_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE badge_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.badge_types_id_seq OWNER TO jamie;

--
-- Name: badge_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE badge_types_id_seq OWNED BY badge_types.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE badges (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    badge_type_id integer NOT NULL,
    grant_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.badges OWNER TO jamie;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.badges_id_seq OWNER TO jamie;

--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE badges_id_seq OWNED BY badges.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(6) DEFAULT 'AB9364'::character varying NOT NULL,
    topic_id integer,
    topic_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer NOT NULL,
    topics_year integer DEFAULT 0,
    topics_month integer DEFAULT 0,
    topics_week integer DEFAULT 0,
    slug character varying(255) NOT NULL,
    description text,
    text_color character varying(6) DEFAULT 'FFFFFF'::character varying NOT NULL,
    read_restricted boolean DEFAULT false NOT NULL,
    auto_close_hours double precision,
    post_count integer DEFAULT 0 NOT NULL,
    latest_post_id integer,
    latest_topic_id integer,
    "position" integer,
    parent_category_id integer,
    posts_year integer DEFAULT 0,
    posts_month integer DEFAULT 0,
    posts_week integer DEFAULT 0,
    email_in character varying(255),
    email_in_allow_strangers boolean DEFAULT false,
    topics_day integer DEFAULT 0,
    posts_day integer DEFAULT 0
);


ALTER TABLE public.categories OWNER TO jamie;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO jamie;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: category_featured_topics; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE category_featured_topics (
    category_id integer NOT NULL,
    topic_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    rank integer DEFAULT 0 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.category_featured_topics OWNER TO jamie;

--
-- Name: category_featured_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE category_featured_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_featured_topics_id_seq OWNER TO jamie;

--
-- Name: category_featured_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE category_featured_topics_id_seq OWNED BY category_featured_topics.id;


--
-- Name: category_featured_users; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE category_featured_users (
    id integer NOT NULL,
    category_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.category_featured_users OWNER TO jamie;

--
-- Name: category_featured_users_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE category_featured_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_featured_users_id_seq OWNER TO jamie;

--
-- Name: category_featured_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE category_featured_users_id_seq OWNED BY category_featured_users.id;


--
-- Name: category_groups; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE category_groups (
    id integer NOT NULL,
    category_id integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    permission_type integer DEFAULT 1
);


ALTER TABLE public.category_groups OWNER TO jamie;

--
-- Name: category_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE category_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_groups_id_seq OWNER TO jamie;

--
-- Name: category_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE category_groups_id_seq OWNED BY category_groups.id;


--
-- Name: category_search_data; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE category_search_data (
    category_id integer NOT NULL,
    search_data tsvector
);


ALTER TABLE public.category_search_data OWNER TO jamie;

--
-- Name: category_users; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE category_users (
    id integer NOT NULL,
    category_id integer NOT NULL,
    user_id integer NOT NULL,
    notification_level integer NOT NULL
);


ALTER TABLE public.category_users OWNER TO jamie;

--
-- Name: category_users_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE category_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_users_id_seq OWNER TO jamie;

--
-- Name: category_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE category_users_id_seq OWNED BY category_users.id;


--
-- Name: draft_sequences; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE draft_sequences (
    id integer NOT NULL,
    user_id integer NOT NULL,
    draft_key character varying(255) NOT NULL,
    sequence integer NOT NULL
);


ALTER TABLE public.draft_sequences OWNER TO jamie;

--
-- Name: draft_sequences_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE draft_sequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.draft_sequences_id_seq OWNER TO jamie;

--
-- Name: draft_sequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE draft_sequences_id_seq OWNED BY draft_sequences.id;


--
-- Name: drafts; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE drafts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    draft_key character varying(255) NOT NULL,
    data text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sequence integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.drafts OWNER TO jamie;

--
-- Name: drafts_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE drafts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drafts_id_seq OWNER TO jamie;

--
-- Name: drafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE drafts_id_seq OWNED BY drafts.id;


--
-- Name: email_logs; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE email_logs (
    id integer NOT NULL,
    to_address character varying(255) NOT NULL,
    email_type character varying(255) NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    reply_key character varying(32),
    post_id integer,
    topic_id integer,
    skipped boolean DEFAULT false,
    skipped_reason character varying(255)
);


ALTER TABLE public.email_logs OWNER TO jamie;

--
-- Name: email_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE email_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_logs_id_seq OWNER TO jamie;

--
-- Name: email_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE email_logs_id_seq OWNED BY email_logs.id;


--
-- Name: email_tokens; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE email_tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    expired boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.email_tokens OWNER TO jamie;

--
-- Name: email_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE email_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_tokens_id_seq OWNER TO jamie;

--
-- Name: email_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE email_tokens_id_seq OWNED BY email_tokens.id;


--
-- Name: facebook_user_infos; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE facebook_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    facebook_user_id bigint NOT NULL,
    username character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    gender character varying(255),
    name character varying(255),
    link character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.facebook_user_infos OWNER TO jamie;

--
-- Name: facebook_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE facebook_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facebook_user_infos_id_seq OWNER TO jamie;

--
-- Name: facebook_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE facebook_user_infos_id_seq OWNED BY facebook_user_infos.id;


--
-- Name: github_user_infos; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE github_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    screen_name character varying(255) NOT NULL,
    github_user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.github_user_infos OWNER TO jamie;

--
-- Name: github_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE github_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.github_user_infos_id_seq OWNER TO jamie;

--
-- Name: github_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE github_user_infos_id_seq OWNED BY github_user_infos.id;


--
-- Name: group_users; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE group_users (
    id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.group_users OWNER TO jamie;

--
-- Name: group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE group_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_users_id_seq OWNER TO jamie;

--
-- Name: group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE group_users_id_seq OWNED BY group_users.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    automatic boolean DEFAULT false NOT NULL,
    user_count integer DEFAULT 0 NOT NULL,
    alias_level integer DEFAULT 0
);


ALTER TABLE public.groups OWNER TO jamie;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE groups_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO jamie;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: incoming_links; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE incoming_links (
    id integer NOT NULL,
    url character varying(1000) NOT NULL,
    referer character varying(1000),
    domain character varying(100),
    topic_id integer,
    post_number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    ip_address inet,
    current_user_id integer
);


ALTER TABLE public.incoming_links OWNER TO jamie;

--
-- Name: incoming_links_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE incoming_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incoming_links_id_seq OWNER TO jamie;

--
-- Name: incoming_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE incoming_links_id_seq OWNED BY incoming_links.id;


--
-- Name: invites; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE invites (
    id integer NOT NULL,
    invite_key character varying(32) NOT NULL,
    email character varying(255) NOT NULL,
    invited_by_id integer NOT NULL,
    user_id integer,
    redeemed_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    deleted_by_id integer,
    invalidated_at timestamp without time zone
);


ALTER TABLE public.invites OWNER TO jamie;

--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invites_id_seq OWNER TO jamie;

--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE invites_id_seq OWNED BY invites.id;


--
-- Name: message_bus; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE message_bus (
    id integer NOT NULL,
    name character varying(255),
    context character varying(255),
    data text,
    created_at timestamp without time zone
);


ALTER TABLE public.message_bus OWNER TO jamie;

--
-- Name: message_bus_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE message_bus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_bus_id_seq OWNER TO jamie;

--
-- Name: message_bus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE message_bus_id_seq OWNED BY message_bus.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    notification_type integer NOT NULL,
    user_id integer NOT NULL,
    data character varying(1000) NOT NULL,
    read boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    topic_id integer,
    post_number integer,
    post_action_id integer
);


ALTER TABLE public.notifications OWNER TO jamie;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO jamie;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: oauth2_user_infos; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE oauth2_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    uid character varying(255) NOT NULL,
    provider character varying(255) NOT NULL,
    email character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.oauth2_user_infos OWNER TO jamie;

--
-- Name: oauth2_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE oauth2_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_user_infos_id_seq OWNER TO jamie;

--
-- Name: oauth2_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE oauth2_user_infos_id_seq OWNED BY oauth2_user_infos.id;


--
-- Name: optimized_images; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE optimized_images (
    id integer NOT NULL,
    sha1 character varying(40) NOT NULL,
    extension character varying(10) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    upload_id integer NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE public.optimized_images OWNER TO jamie;

--
-- Name: optimized_images_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE optimized_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.optimized_images_id_seq OWNER TO jamie;

--
-- Name: optimized_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE optimized_images_id_seq OWNED BY optimized_images.id;


--
-- Name: plugin_store_rows; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE plugin_store_rows (
    id integer NOT NULL,
    plugin_name character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    type_name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.plugin_store_rows OWNER TO jamie;

--
-- Name: plugin_store_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE plugin_store_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plugin_store_rows_id_seq OWNER TO jamie;

--
-- Name: plugin_store_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE plugin_store_rows_id_seq OWNED BY plugin_store_rows.id;


--
-- Name: post_action_types; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_action_types (
    name_key character varying(50) NOT NULL,
    is_flag boolean DEFAULT false NOT NULL,
    icon character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL,
    "position" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.post_action_types OWNER TO jamie;

--
-- Name: post_action_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE post_action_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_action_types_id_seq OWNER TO jamie;

--
-- Name: post_action_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE post_action_types_id_seq OWNED BY post_action_types.id;


--
-- Name: post_actions; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_actions (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    post_action_type_id integer NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_by_id integer,
    message text,
    related_post_id integer,
    staff_took_action boolean DEFAULT false NOT NULL,
    defer boolean,
    defer_by integer,
    targets_topic boolean DEFAULT false
);


ALTER TABLE public.post_actions OWNER TO jamie;

--
-- Name: post_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE post_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_actions_id_seq OWNER TO jamie;

--
-- Name: post_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE post_actions_id_seq OWNED BY post_actions.id;


--
-- Name: post_details; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_details (
    id integer NOT NULL,
    post_id integer,
    key character varying(255),
    value character varying(255),
    extra text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.post_details OWNER TO jamie;

--
-- Name: post_details_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE post_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_details_id_seq OWNER TO jamie;

--
-- Name: post_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE post_details_id_seq OWNED BY post_details.id;


--
-- Name: post_replies; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_replies (
    post_id integer,
    reply_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.post_replies OWNER TO jamie;

--
-- Name: post_revisions; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_revisions (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    modifications text,
    number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.post_revisions OWNER TO jamie;

--
-- Name: post_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE post_revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_revisions_id_seq OWNER TO jamie;

--
-- Name: post_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE post_revisions_id_seq OWNED BY post_revisions.id;


--
-- Name: post_search_data; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_search_data (
    post_id integer NOT NULL,
    search_data tsvector
);


ALTER TABLE public.post_search_data OWNER TO jamie;

--
-- Name: post_timings; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_timings (
    topic_id integer NOT NULL,
    post_number integer NOT NULL,
    user_id integer NOT NULL,
    msecs integer NOT NULL
);


ALTER TABLE public.post_timings OWNER TO jamie;

--
-- Name: post_uploads; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE post_uploads (
    id integer NOT NULL,
    post_id integer NOT NULL,
    upload_id integer NOT NULL
);


ALTER TABLE public.post_uploads OWNER TO jamie;

--
-- Name: post_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE post_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_uploads_id_seq OWNER TO jamie;

--
-- Name: post_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE post_uploads_id_seq OWNED BY post_uploads.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    user_id integer,
    topic_id integer NOT NULL,
    post_number integer NOT NULL,
    raw text NOT NULL,
    cooked text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    reply_to_post_number integer,
    reply_count integer DEFAULT 0 NOT NULL,
    quote_count integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    off_topic_count integer DEFAULT 0 NOT NULL,
    like_count integer DEFAULT 0 NOT NULL,
    incoming_link_count integer DEFAULT 0 NOT NULL,
    bookmark_count integer DEFAULT 0 NOT NULL,
    avg_time integer,
    score double precision,
    reads integer DEFAULT 0 NOT NULL,
    post_type integer DEFAULT 1 NOT NULL,
    vote_count integer DEFAULT 0 NOT NULL,
    sort_order integer,
    last_editor_id integer,
    hidden boolean DEFAULT false NOT NULL,
    hidden_reason_id integer,
    notify_moderators_count integer DEFAULT 0 NOT NULL,
    spam_count integer DEFAULT 0 NOT NULL,
    illegal_count integer DEFAULT 0 NOT NULL,
    inappropriate_count integer DEFAULT 0 NOT NULL,
    last_version_at timestamp without time zone NOT NULL,
    user_deleted boolean DEFAULT false NOT NULL,
    reply_to_user_id integer,
    percent_rank double precision DEFAULT 1.0,
    notify_user_count integer DEFAULT 0 NOT NULL,
    like_score integer DEFAULT 0 NOT NULL,
    deleted_by_id integer,
    edit_reason character varying(255),
    word_count integer,
    version integer DEFAULT 1 NOT NULL,
    cook_method integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.posts OWNER TO jamie;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO jamie;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO jamie;

--
-- Name: screened_emails; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE screened_emails (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    action_type integer NOT NULL,
    match_count integer DEFAULT 0 NOT NULL,
    last_match_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ip_address inet
);


ALTER TABLE public.screened_emails OWNER TO jamie;

--
-- Name: screened_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE screened_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.screened_emails_id_seq OWNER TO jamie;

--
-- Name: screened_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE screened_emails_id_seq OWNED BY screened_emails.id;


--
-- Name: screened_ip_addresses; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE screened_ip_addresses (
    id integer NOT NULL,
    ip_address inet NOT NULL,
    action_type integer NOT NULL,
    match_count integer DEFAULT 0 NOT NULL,
    last_match_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.screened_ip_addresses OWNER TO jamie;

--
-- Name: screened_ip_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE screened_ip_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.screened_ip_addresses_id_seq OWNER TO jamie;

--
-- Name: screened_ip_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE screened_ip_addresses_id_seq OWNED BY screened_ip_addresses.id;


--
-- Name: screened_urls; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE screened_urls (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    domain character varying(255) NOT NULL,
    action_type integer NOT NULL,
    match_count integer DEFAULT 0 NOT NULL,
    last_match_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ip_address inet
);


ALTER TABLE public.screened_urls OWNER TO jamie;

--
-- Name: screened_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE screened_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.screened_urls_id_seq OWNER TO jamie;

--
-- Name: screened_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE screened_urls_id_seq OWNED BY screened_urls.id;


--
-- Name: single_sign_on_records; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE single_sign_on_records (
    id integer NOT NULL,
    user_id integer NOT NULL,
    external_id character varying(255) NOT NULL,
    last_payload text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    external_username character varying(255),
    external_email character varying(255),
    external_name character varying(255)
);


ALTER TABLE public.single_sign_on_records OWNER TO jamie;

--
-- Name: single_sign_on_records_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE single_sign_on_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.single_sign_on_records_id_seq OWNER TO jamie;

--
-- Name: single_sign_on_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE single_sign_on_records_id_seq OWNED BY single_sign_on_records.id;


--
-- Name: site_contents; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE site_contents (
    content_type character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.site_contents OWNER TO jamie;

--
-- Name: site_customizations; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE site_customizations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    stylesheet text,
    header text,
    "position" integer NOT NULL,
    user_id integer NOT NULL,
    enabled boolean NOT NULL,
    key character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    override_default_style boolean DEFAULT false NOT NULL,
    stylesheet_baked text DEFAULT ''::text NOT NULL,
    mobile_stylesheet text,
    mobile_header text,
    mobile_stylesheet_baked text
);


ALTER TABLE public.site_customizations OWNER TO jamie;

--
-- Name: site_customizations_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE site_customizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_customizations_id_seq OWNER TO jamie;

--
-- Name: site_customizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE site_customizations_id_seq OWNED BY site_customizations.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE site_settings (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    data_type integer NOT NULL,
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.site_settings OWNER TO jamie;

--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE site_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_settings_id_seq OWNER TO jamie;

--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE site_settings_id_seq OWNED BY site_settings.id;


--
-- Name: top_topics; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE top_topics (
    id integer NOT NULL,
    topic_id integer,
    yearly_posts_count integer DEFAULT 0 NOT NULL,
    yearly_views_count integer DEFAULT 0 NOT NULL,
    yearly_likes_count integer DEFAULT 0 NOT NULL,
    monthly_posts_count integer DEFAULT 0 NOT NULL,
    monthly_views_count integer DEFAULT 0 NOT NULL,
    monthly_likes_count integer DEFAULT 0 NOT NULL,
    weekly_posts_count integer DEFAULT 0 NOT NULL,
    weekly_views_count integer DEFAULT 0 NOT NULL,
    weekly_likes_count integer DEFAULT 0 NOT NULL,
    daily_posts_count integer DEFAULT 0 NOT NULL,
    daily_views_count integer DEFAULT 0 NOT NULL,
    daily_likes_count integer DEFAULT 0 NOT NULL,
    yearly_score double precision,
    monthly_score double precision,
    weekly_score double precision,
    daily_score double precision
);


ALTER TABLE public.top_topics OWNER TO jamie;

--
-- Name: top_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE top_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.top_topics_id_seq OWNER TO jamie;

--
-- Name: top_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE top_topics_id_seq OWNED BY top_topics.id;


--
-- Name: topic_allowed_groups; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topic_allowed_groups (
    id integer NOT NULL,
    group_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE public.topic_allowed_groups OWNER TO jamie;

--
-- Name: topic_allowed_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topic_allowed_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_allowed_groups_id_seq OWNER TO jamie;

--
-- Name: topic_allowed_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topic_allowed_groups_id_seq OWNED BY topic_allowed_groups.id;


--
-- Name: topic_allowed_users; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topic_allowed_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    topic_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.topic_allowed_users OWNER TO jamie;

--
-- Name: topic_allowed_users_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topic_allowed_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_allowed_users_id_seq OWNER TO jamie;

--
-- Name: topic_allowed_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topic_allowed_users_id_seq OWNED BY topic_allowed_users.id;


--
-- Name: topic_embeds; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topic_embeds (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    post_id integer NOT NULL,
    embed_url character varying(255) NOT NULL,
    content_sha1 character varying(40) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.topic_embeds OWNER TO jamie;

--
-- Name: topic_embeds_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topic_embeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_embeds_id_seq OWNER TO jamie;

--
-- Name: topic_embeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topic_embeds_id_seq OWNED BY topic_embeds.id;


--
-- Name: topic_invites; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topic_invites (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    invite_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.topic_invites OWNER TO jamie;

--
-- Name: topic_invites_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topic_invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_invites_id_seq OWNER TO jamie;

--
-- Name: topic_invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topic_invites_id_seq OWNED BY topic_invites.id;


--
-- Name: topic_link_clicks; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topic_link_clicks (
    id integer NOT NULL,
    topic_link_id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ip_address inet NOT NULL
);


ALTER TABLE public.topic_link_clicks OWNER TO jamie;

--
-- Name: topic_link_clicks_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topic_link_clicks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_link_clicks_id_seq OWNER TO jamie;

--
-- Name: topic_link_clicks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topic_link_clicks_id_seq OWNED BY topic_link_clicks.id;


--
-- Name: topic_links; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topic_links (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    post_id integer,
    user_id integer NOT NULL,
    url character varying(500) NOT NULL,
    domain character varying(100) NOT NULL,
    internal boolean DEFAULT false NOT NULL,
    link_topic_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    reflection boolean DEFAULT false,
    clicks integer DEFAULT 0 NOT NULL,
    link_post_id integer
);


ALTER TABLE public.topic_links OWNER TO jamie;

--
-- Name: topic_links_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topic_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_links_id_seq OWNER TO jamie;

--
-- Name: topic_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topic_links_id_seq OWNED BY topic_links.id;


--
-- Name: topic_users; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topic_users (
    user_id integer NOT NULL,
    topic_id integer NOT NULL,
    starred boolean DEFAULT false NOT NULL,
    posted boolean DEFAULT false NOT NULL,
    last_read_post_number integer,
    seen_post_count integer,
    starred_at timestamp without time zone,
    last_visited_at timestamp without time zone,
    first_visited_at timestamp without time zone,
    notification_level integer DEFAULT 1 NOT NULL,
    notifications_changed_at timestamp without time zone,
    notifications_reason_id integer,
    total_msecs_viewed integer DEFAULT 0 NOT NULL,
    cleared_pinned_at timestamp without time zone,
    unstarred_at timestamp without time zone,
    id integer NOT NULL,
    last_emailed_post_number integer,
    CONSTRAINT test_starred_at CHECK (((starred = false) OR (starred_at IS NOT NULL)))
);


ALTER TABLE public.topic_users OWNER TO jamie;

--
-- Name: topic_users_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topic_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_users_id_seq OWNER TO jamie;

--
-- Name: topic_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topic_users_id_seq OWNED BY topic_users.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE topics (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    last_posted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    views integer DEFAULT 0 NOT NULL,
    posts_count integer DEFAULT 0 NOT NULL,
    user_id integer,
    last_post_user_id integer NOT NULL,
    reply_count integer DEFAULT 0 NOT NULL,
    featured_user1_id integer,
    featured_user2_id integer,
    featured_user3_id integer,
    avg_time integer,
    deleted_at timestamp without time zone,
    highest_post_number integer DEFAULT 0 NOT NULL,
    image_url character varying(255),
    off_topic_count integer DEFAULT 0 NOT NULL,
    like_count integer DEFAULT 0 NOT NULL,
    incoming_link_count integer DEFAULT 0 NOT NULL,
    bookmark_count integer DEFAULT 0 NOT NULL,
    star_count integer DEFAULT 0 NOT NULL,
    category_id integer,
    visible boolean DEFAULT true NOT NULL,
    moderator_posts_count integer DEFAULT 0 NOT NULL,
    closed boolean DEFAULT false NOT NULL,
    archived boolean DEFAULT false NOT NULL,
    bumped_at timestamp without time zone NOT NULL,
    has_summary boolean DEFAULT false NOT NULL,
    meta_data hstore,
    vote_count integer DEFAULT 0 NOT NULL,
    archetype character varying(255) DEFAULT 'regular'::character varying NOT NULL,
    featured_user4_id integer,
    notify_moderators_count integer DEFAULT 0 NOT NULL,
    spam_count integer DEFAULT 0 NOT NULL,
    illegal_count integer DEFAULT 0 NOT NULL,
    inappropriate_count integer DEFAULT 0 NOT NULL,
    pinned_at timestamp without time zone,
    score double precision,
    percent_rank double precision DEFAULT 1.0 NOT NULL,
    notify_user_count integer DEFAULT 0 NOT NULL,
    subtype character varying(255),
    slug character varying(255),
    auto_close_at timestamp without time zone,
    auto_close_user_id integer,
    auto_close_started_at timestamp without time zone,
    deleted_by_id integer,
    participant_count integer DEFAULT 1,
    word_count integer,
    excerpt character varying(1000),
    CONSTRAINT has_category_id CHECK (((category_id IS NOT NULL) OR ((archetype)::text <> 'regular'::text)))
);


ALTER TABLE public.topics OWNER TO jamie;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO jamie;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE topics_id_seq OWNED BY topics.id;


--
-- Name: twitter_user_infos; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE twitter_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    screen_name character varying(255) NOT NULL,
    twitter_user_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.twitter_user_infos OWNER TO jamie;

--
-- Name: twitter_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE twitter_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.twitter_user_infos_id_seq OWNER TO jamie;

--
-- Name: twitter_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE twitter_user_infos_id_seq OWNED BY twitter_user_infos.id;


--
-- Name: uploads; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE uploads (
    id integer NOT NULL,
    user_id integer NOT NULL,
    original_filename character varying(255) NOT NULL,
    filesize integer NOT NULL,
    width integer,
    height integer,
    url character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sha1 character varying(40),
    origin character varying(1000)
);


ALTER TABLE public.uploads OWNER TO jamie;

--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uploads_id_seq OWNER TO jamie;

--
-- Name: uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE uploads_id_seq OWNED BY uploads.id;


--
-- Name: user_actions; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE user_actions (
    id integer NOT NULL,
    action_type integer NOT NULL,
    user_id integer NOT NULL,
    target_topic_id integer,
    target_post_id integer,
    target_user_id integer,
    acting_user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_actions OWNER TO jamie;

--
-- Name: user_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE user_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_actions_id_seq OWNER TO jamie;

--
-- Name: user_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE user_actions_id_seq OWNED BY user_actions.id;


--
-- Name: user_badges; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE user_badges (
    id integer NOT NULL,
    badge_id integer NOT NULL,
    user_id integer NOT NULL,
    granted_at timestamp without time zone NOT NULL,
    granted_by_id integer NOT NULL
);


ALTER TABLE public.user_badges OWNER TO jamie;

--
-- Name: user_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE user_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_badges_id_seq OWNER TO jamie;

--
-- Name: user_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE user_badges_id_seq OWNED BY user_badges.id;


--
-- Name: user_histories; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE user_histories (
    id integer NOT NULL,
    action integer NOT NULL,
    acting_user_id integer,
    target_user_id integer,
    details text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    context character varying(255),
    ip_address character varying(255),
    email character varying(255),
    subject text,
    previous_value text,
    new_value text,
    topic_id integer,
    admin_only boolean DEFAULT false
);


ALTER TABLE public.user_histories OWNER TO jamie;

--
-- Name: user_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE user_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_histories_id_seq OWNER TO jamie;

--
-- Name: user_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE user_histories_id_seq OWNED BY user_histories.id;


--
-- Name: user_open_ids; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE user_open_ids (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    active boolean NOT NULL
);


ALTER TABLE public.user_open_ids OWNER TO jamie;

--
-- Name: user_open_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE user_open_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_open_ids_id_seq OWNER TO jamie;

--
-- Name: user_open_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE user_open_ids_id_seq OWNED BY user_open_ids.id;


--
-- Name: user_search_data; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE user_search_data (
    user_id integer NOT NULL,
    search_data tsvector
);


ALTER TABLE public.user_search_data OWNER TO jamie;

--
-- Name: user_stats; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE user_stats (
    user_id integer NOT NULL,
    has_custom_avatar boolean DEFAULT false NOT NULL,
    topics_entered integer DEFAULT 0 NOT NULL,
    time_read integer DEFAULT 0 NOT NULL,
    days_visited integer DEFAULT 0 NOT NULL,
    posts_read_count integer DEFAULT 0 NOT NULL,
    likes_given integer DEFAULT 0 NOT NULL,
    likes_received integer DEFAULT 0 NOT NULL,
    topic_reply_count integer DEFAULT 0 NOT NULL,
    new_since timestamp without time zone NOT NULL
);


ALTER TABLE public.user_stats OWNER TO jamie;

--
-- Name: user_visits; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE user_visits (
    id integer NOT NULL,
    user_id integer NOT NULL,
    visited_at date NOT NULL,
    posts_read integer DEFAULT 0
);


ALTER TABLE public.user_visits OWNER TO jamie;

--
-- Name: user_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE user_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_visits_id_seq OWNER TO jamie;

--
-- Name: user_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE user_visits_id_seq OWNED BY user_visits.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    bio_raw text,
    seen_notification_id integer DEFAULT 0 NOT NULL,
    last_posted_at timestamp without time zone,
    email character varying(256) NOT NULL,
    password_hash character varying(64),
    salt character varying(32),
    active boolean,
    username_lower character varying(20) NOT NULL,
    auth_token character varying(32),
    last_seen_at timestamp without time zone,
    website character varying(255),
    admin boolean DEFAULT false NOT NULL,
    last_emailed_at timestamp without time zone,
    email_digests boolean NOT NULL,
    trust_level integer NOT NULL,
    bio_cooked text,
    email_private_messages boolean DEFAULT true,
    email_direct boolean DEFAULT true NOT NULL,
    approved boolean DEFAULT false NOT NULL,
    approved_by_id integer,
    approved_at timestamp without time zone,
    digest_after_days integer,
    previous_visit_at timestamp without time zone,
    suspended_at timestamp without time zone,
    suspended_till timestamp without time zone,
    date_of_birth date,
    auto_track_topics_after_msecs integer,
    views integer DEFAULT 0 NOT NULL,
    flag_level integer DEFAULT 0 NOT NULL,
    ip_address inet,
    new_topic_duration_minutes integer,
    external_links_in_new_tab boolean NOT NULL,
    enable_quoting boolean DEFAULT true NOT NULL,
    moderator boolean DEFAULT false,
    blocked boolean DEFAULT false,
    dynamic_favicon boolean DEFAULT false NOT NULL,
    title character varying(255),
    use_uploaded_avatar boolean DEFAULT false,
    uploaded_avatar_template character varying(255),
    uploaded_avatar_id integer,
    email_always boolean DEFAULT false NOT NULL,
    mailing_list_mode boolean DEFAULT false NOT NULL,
    locale character varying(10),
    primary_group_id integer,
    profile_background character varying(255)
);


ALTER TABLE public.users OWNER TO jamie;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jamie;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    versioned_id integer,
    versioned_type character varying(255),
    user_id integer,
    user_type character varying(255),
    user_name character varying(255),
    modifications text,
    number integer,
    reverted_from integer,
    tag character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.versions OWNER TO jamie;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: jamie
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO jamie;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamie
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: views; Type: TABLE; Schema: public; Owner: jamie; Tablespace: 
--

CREATE TABLE views (
    parent_id integer NOT NULL,
    parent_type character varying(50) NOT NULL,
    viewed_at date NOT NULL,
    user_id integer,
    ip_address inet NOT NULL
);


ALTER TABLE public.views OWNER TO jamie;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY badge_types ALTER COLUMN id SET DEFAULT nextval('badge_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY badges ALTER COLUMN id SET DEFAULT nextval('badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY category_featured_topics ALTER COLUMN id SET DEFAULT nextval('category_featured_topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY category_featured_users ALTER COLUMN id SET DEFAULT nextval('category_featured_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY category_groups ALTER COLUMN id SET DEFAULT nextval('category_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY category_users ALTER COLUMN id SET DEFAULT nextval('category_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY draft_sequences ALTER COLUMN id SET DEFAULT nextval('draft_sequences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY drafts ALTER COLUMN id SET DEFAULT nextval('drafts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY email_logs ALTER COLUMN id SET DEFAULT nextval('email_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY email_tokens ALTER COLUMN id SET DEFAULT nextval('email_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY facebook_user_infos ALTER COLUMN id SET DEFAULT nextval('facebook_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY github_user_infos ALTER COLUMN id SET DEFAULT nextval('github_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY group_users ALTER COLUMN id SET DEFAULT nextval('group_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY incoming_links ALTER COLUMN id SET DEFAULT nextval('incoming_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY invites ALTER COLUMN id SET DEFAULT nextval('invites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY message_bus ALTER COLUMN id SET DEFAULT nextval('message_bus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY oauth2_user_infos ALTER COLUMN id SET DEFAULT nextval('oauth2_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY optimized_images ALTER COLUMN id SET DEFAULT nextval('optimized_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY plugin_store_rows ALTER COLUMN id SET DEFAULT nextval('plugin_store_rows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY post_action_types ALTER COLUMN id SET DEFAULT nextval('post_action_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY post_actions ALTER COLUMN id SET DEFAULT nextval('post_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY post_details ALTER COLUMN id SET DEFAULT nextval('post_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY post_revisions ALTER COLUMN id SET DEFAULT nextval('post_revisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY post_uploads ALTER COLUMN id SET DEFAULT nextval('post_uploads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY screened_emails ALTER COLUMN id SET DEFAULT nextval('screened_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY screened_ip_addresses ALTER COLUMN id SET DEFAULT nextval('screened_ip_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY screened_urls ALTER COLUMN id SET DEFAULT nextval('screened_urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY single_sign_on_records ALTER COLUMN id SET DEFAULT nextval('single_sign_on_records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY site_customizations ALTER COLUMN id SET DEFAULT nextval('site_customizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY site_settings ALTER COLUMN id SET DEFAULT nextval('site_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY top_topics ALTER COLUMN id SET DEFAULT nextval('top_topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topic_allowed_groups ALTER COLUMN id SET DEFAULT nextval('topic_allowed_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topic_allowed_users ALTER COLUMN id SET DEFAULT nextval('topic_allowed_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topic_embeds ALTER COLUMN id SET DEFAULT nextval('topic_embeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topic_invites ALTER COLUMN id SET DEFAULT nextval('topic_invites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topic_link_clicks ALTER COLUMN id SET DEFAULT nextval('topic_link_clicks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topic_links ALTER COLUMN id SET DEFAULT nextval('topic_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topic_users ALTER COLUMN id SET DEFAULT nextval('topic_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY twitter_user_infos ALTER COLUMN id SET DEFAULT nextval('twitter_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY uploads ALTER COLUMN id SET DEFAULT nextval('uploads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY user_actions ALTER COLUMN id SET DEFAULT nextval('user_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY user_badges ALTER COLUMN id SET DEFAULT nextval('user_badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY user_histories ALTER COLUMN id SET DEFAULT nextval('user_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY user_open_ids ALTER COLUMN id SET DEFAULT nextval('user_open_ids_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY user_visits ALTER COLUMN id SET DEFAULT nextval('user_visits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jamie
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY api_keys (id, key, user_id, created_by_id, created_at, updated_at) FROM stdin;
1	2765834b74b09cc7d9f7ae76b5f624208e31f74e6b286802c1eabe2c93fcdf16	\N	-1	2014-03-31 15:36:44.624194	2014-03-31 15:36:44.624194
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('api_keys_id_seq', 1, true);


--
-- Data for Name: badge_types; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY badge_types (id, name, color_hexcode, created_at, updated_at) FROM stdin;
1	Gold	ffd700	2014-03-31 15:09:52.006417	2014-03-31 15:09:52.006417
2	Silver	c0c0c0	2014-03-31 15:09:52.028124	2014-03-31 15:09:52.028124
3	Bronze	cd7f32	2014-03-31 15:09:52.037108	2014-03-31 15:09:52.037108
\.


--
-- Name: badge_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('badge_types_id_seq', 4, true);


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY badges (id, name, description, badge_type_id, grant_count, created_at, updated_at) FROM stdin;
\.


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('badges_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY categories (id, name, color, topic_id, topic_count, created_at, updated_at, user_id, topics_year, topics_month, topics_week, slug, description, text_color, read_restricted, auto_close_hours, post_count, latest_post_id, latest_topic_id, "position", parent_category_id, posts_year, posts_month, posts_week, email_in, email_in_allow_strangers, topics_day, posts_day) FROM stdin;
6	Trying to Avoid	25AAE2	11	0	2014-03-31 16:37:40.033564	2014-03-31 16:37:40.033564	2	0	0	0	trying-to-avoid	\N	FFFFFF	f	\N	0	12	\N	\N	\N	0	0	0	\N	f	0	0
7	Share the Good News	12A89D	12	0	2014-03-31 16:38:40.029544	2014-03-31 16:38:40.029544	2	0	0	0	share-the-good-news	\N	FFFFFF	f	\N	0	14	\N	\N	\N	0	0	0	\N	f	0	0
8	Fertility Questions	3AB54A	13	0	2014-03-31 16:40:36.478183	2014-03-31 16:40:36.478183	2	0	0	0	fertility-questions	\N	FFFFFF	f	\N	0	16	\N	\N	\N	0	0	0	\N	f	0	0
5	Trying to conceive	0E76BD	10	2	2014-03-31 16:36:15.179019	2014-04-01 16:26:54.192499	2	2	2	2	trying-to-conceive	\N	FFFFFF	f	\N	2	20	16	\N	\N	2	2	2	\N	f	2	2
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('categories_id_seq', 9, true);


--
-- Data for Name: category_featured_topics; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY category_featured_topics (category_id, topic_id, created_at, updated_at, rank, id) FROM stdin;
3	2	2014-03-31 15:09:51.80126	2014-03-31 15:09:51.80126	0	2
4	5	2014-03-31 15:09:52.827187	2014-03-31 15:09:52.827187	0	5
4	4	2014-03-31 15:09:52.828205	2014-03-31 15:09:52.828205	1	6
1	6	2014-03-31 15:09:52.885428	2014-03-31 15:09:52.885428	0	7
2	9	2014-03-31 15:50:05.300862	2014-03-31 15:50:05.300862	0	10
\.


--
-- Name: category_featured_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('category_featured_topics_id_seq', 13, true);


--
-- Data for Name: category_featured_users; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY category_featured_users (id, category_id, user_id, created_at, updated_at) FROM stdin;
1	6	2	2014-04-01 16:26:52.137159	2014-04-01 16:26:52.137159
2	7	2	2014-04-01 16:26:52.143115	2014-04-01 16:26:52.143115
3	8	2	2014-04-01 16:26:52.147497	2014-04-01 16:26:52.147497
4	5	2	2014-04-01 16:26:52.152402	2014-04-01 16:26:52.152402
\.


--
-- Name: category_featured_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('category_featured_users_id_seq', 4, true);


--
-- Data for Name: category_groups; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY category_groups (id, category_id, group_id, created_at, updated_at, permission_type) FROM stdin;
2	4	3	2014-03-31 15:09:51.875723	2014-03-31 15:09:51.875723	1
3	2	13	2014-03-31 16:29:14.138008	2014-03-31 16:29:14.138008	1
4	1	1	2014-03-31 16:30:52.336356	2014-03-31 16:30:52.336356	1
\.


--
-- Name: category_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('category_groups_id_seq', 4, true);


--
-- Data for Name: category_search_data; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY category_search_data (category_id, search_data) FROM stdin;
2	'foo':1
6	'avoid':3 'tri':1
7	'good':3 'news':4 'share':1
8	'fertil':1 'question':2
5	'conceiv':3 'tri':1
\.


--
-- Data for Name: category_users; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY category_users (id, category_id, user_id, notification_level) FROM stdin;
\.


--
-- Name: category_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('category_users_id_seq', 1, false);


--
-- Data for Name: draft_sequences; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY draft_sequences (id, user_id, draft_key, sequence) FROM stdin;
2	-1	topic_1	1
3	-1	topic_2	1
4	-1	topic_3	1
5	-1	topic_4	1
6	-1	topic_5	1
1	-1	new_topic	6
7	-1	topic_6	1
8	2	topic_6	1
12	2	topic_9	1
14	2	topic_11	1
15	2	topic_12	1
16	2	topic_13	1
17	2	topic_14	1
19	1	topic_15	1
11	2	new_topic	3
20	2	topic_16	1
13	2	topic_10	2
21	1	topic_17	1
18	1	new_private_message	3
22	1	topic_18	1
\.


--
-- Name: draft_sequences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('draft_sequences_id_seq', 22, true);


--
-- Data for Name: drafts; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY drafts (id, user_id, draft_key, data, created_at, updated_at, sequence) FROM stdin;
\.


--
-- Name: drafts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('drafts_id_seq', 1, true);


--
-- Data for Name: email_logs; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY email_logs (id, to_address, email_type, user_id, created_at, updated_at, reply_key, post_id, topic_id, skipped, skipped_reason) FROM stdin;
1	jgaskins@gmail.com	user_private_message	2	2014-04-01 16:13:31.107735	2014-04-01 16:13:31.107735	\N	\N	\N	t	User was seen recently
2	jgaskins@gmail.com	user_private_message	2	2014-04-01 16:26:49.188737	2014-04-01 16:26:49.188737	\N	\N	\N	t	User was seen recently
3	jgaskins@gmail.com	user_private_message	2	2014-04-01 16:37:19.178438	2014-04-01 16:37:19.178438	\N	\N	\N	t	User was seen recently
\.


--
-- Name: email_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('email_logs_id_seq', 3, true);


--
-- Data for Name: email_tokens; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY email_tokens (id, user_id, email, token, confirmed, expired, created_at, updated_at) FROM stdin;
1	-1	no_email	e5270742f3202b974d666fd877f126c8	f	f	2014-03-31 15:09:51.158055	2014-03-31 15:09:51.158055
2	1	jamie@inthebackforty.com	da8d06d4e2fb995b133902517a35fd19	t	f	2014-03-31 15:11:26.164193	2014-03-31 15:11:26.164193
3	2	jgaskins@gmail.com	a5617af8bd270a12a56a156b6729a6f2	f	f	2014-03-31 15:21:08.935161	2014-03-31 15:21:08.935161
\.


--
-- Name: email_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('email_tokens_id_seq', 3, true);


--
-- Data for Name: facebook_user_infos; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY facebook_user_infos (id, user_id, facebook_user_id, username, first_name, last_name, email, gender, name, link, created_at, updated_at) FROM stdin;
\.


--
-- Name: facebook_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('facebook_user_infos_id_seq', 1, false);


--
-- Data for Name: github_user_infos; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY github_user_infos (id, user_id, screen_name, github_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: github_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('github_user_infos_id_seq', 1, false);


--
-- Data for Name: group_users; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY group_users (id, group_id, user_id, created_at, updated_at) FROM stdin;
1	1	2	2014-04-01 16:26:50.136406	2014-04-01 16:26:50.136406
2	1	1	2014-04-01 16:26:50.14183	2014-04-01 16:26:50.14183
3	1	-1	2014-04-01 16:26:50.143772	2014-04-01 16:26:50.143772
4	2	-1	2014-04-01 16:26:50.158725	2014-04-01 16:26:50.158725
5	3	2	2014-04-01 16:26:50.23326	2014-04-01 16:26:50.23326
6	3	1	2014-04-01 16:26:50.235233	2014-04-01 16:26:50.235233
7	3	-1	2014-04-01 16:26:50.236904	2014-04-01 16:26:50.236904
8	14	-1	2014-04-01 16:26:50.260134	2014-04-01 16:26:50.260134
\.


--
-- Name: group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('group_users_id_seq', 8, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY groups (id, name, created_at, updated_at, automatic, user_count, alias_level) FROM stdin;
0	everyone	2014-03-31 15:09:50.674311	2014-03-31 15:09:50.674311	t	0	0
1	admins	2014-03-31 15:09:50.692837	2014-03-31 15:09:50.692837	t	3	0
2	moderators	2014-03-31 15:09:50.777766	2014-03-31 15:09:50.777766	t	1	0
3	staff	2014-03-31 15:09:50.784488	2014-03-31 15:09:50.784488	t	3	0
11	trust_level_1	2014-03-31 15:09:50.790377	2014-03-31 15:09:50.790377	t	0	0
12	trust_level_2	2014-03-31 15:09:50.796143	2014-03-31 15:09:50.796143	t	0	0
13	trust_level_3	2014-03-31 15:09:50.801957	2014-03-31 15:09:50.801957	t	0	0
14	trust_level_4	2014-03-31 15:09:50.807755	2014-03-31 15:09:50.807755	t	1	0
15	trust_level_5	2014-03-31 15:09:50.813381	2014-03-31 15:09:50.813381	t	0	0
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('groups_id_seq', 40, true);


--
-- Data for Name: incoming_links; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY incoming_links (id, url, referer, domain, topic_id, post_number, created_at, updated_at, user_id, ip_address, current_user_id) FROM stdin;
\.


--
-- Name: incoming_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('incoming_links_id_seq', 1, false);


--
-- Data for Name: invites; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY invites (id, invite_key, email, invited_by_id, user_id, redeemed_at, created_at, updated_at, deleted_at, deleted_by_id, invalidated_at) FROM stdin;
\.


--
-- Name: invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('invites_id_seq', 1, false);


--
-- Data for Name: message_bus; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY message_bus (id, name, context, data, created_at) FROM stdin;
\.


--
-- Name: message_bus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('message_bus_id_seq', 1, false);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY notifications (id, notification_type, user_id, data, read, created_at, updated_at, topic_id, post_number, post_action_id) FROM stdin;
1	9	-1	{"topic_title":"Welcome to Discourse","original_post_id":7,"original_username":"jamie","display_username":"jamie"}	t	2014-03-31 15:44:58.55466	2014-03-31 15:44:58.55466	6	2	\N
2	6	2	{"topic_title":"Export completed successfully","original_post_id":18,"original_username":"jgaskins","display_username":"jgaskins"}	t	2014-04-01 14:35:34.341733	2014-04-01 14:35:34.341733	15	1	\N
3	6	2	{"topic_title":"Export completed successfully","original_post_id":21,"original_username":"jgaskins","display_username":"jgaskins"}	t	2014-04-01 16:11:18.716044	2014-04-01 16:11:18.716044	17	1	\N
4	6	2	{"topic_title":"Export completed successfully","original_post_id":22,"original_username":"jgaskins","display_username":"jgaskins"}	t	2014-04-01 16:27:14.486044	2014-04-01 16:27:14.486044	18	1	\N
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('notifications_id_seq', 4, true);


--
-- Data for Name: oauth2_user_infos; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY oauth2_user_infos (id, user_id, uid, provider, email, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth2_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('oauth2_user_infos_id_seq', 1, false);


--
-- Data for Name: optimized_images; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY optimized_images (id, sha1, extension, width, height, upload_id, url) FROM stdin;
\.


--
-- Name: optimized_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('optimized_images_id_seq', 1, false);


--
-- Data for Name: plugin_store_rows; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY plugin_store_rows (id, plugin_name, key, type_name, value) FROM stdin;
\.


--
-- Name: plugin_store_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('plugin_store_rows_id_seq', 1, false);


--
-- Data for Name: post_action_types; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_action_types (name_key, is_flag, icon, created_at, updated_at, id, "position") FROM stdin;
bookmark	f	\N	2014-03-31 15:09:50.829195	2014-03-31 15:09:50.829195	1	1
like	f	heart	2014-03-31 15:09:50.839412	2014-03-31 15:09:50.839412	2	2
off_topic	t	\N	2014-03-31 15:09:50.841544	2014-03-31 15:09:50.841544	3	3
inappropriate	t	\N	2014-03-31 15:09:50.8435	2014-03-31 15:09:50.8435	4	4
vote	f	\N	2014-03-31 15:09:50.845315	2014-03-31 15:09:50.845315	5	5
spam	t	\N	2014-03-31 15:09:50.847101	2014-03-31 15:09:50.847101	8	6
notify_user	t	\N	2014-03-31 15:09:50.848917	2014-03-31 15:09:50.848917	6	7
notify_moderators	t	\N	2014-03-31 15:09:50.850731	2014-03-31 15:09:50.850731	7	8
\.


--
-- Name: post_action_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('post_action_types_id_seq', 9, true);


--
-- Data for Name: post_actions; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_actions (id, post_id, user_id, post_action_type_id, deleted_at, created_at, updated_at, deleted_by_id, message, related_post_id, staff_took_action, defer, defer_by, targets_topic) FROM stdin;
1	6	2	1	2014-03-31 15:46:02.256281	2014-03-31 15:46:01.431055	2014-03-31 15:46:01.431055	2	\N	\N	f	\N	\N	f
3	17	2	1	2014-04-01 13:16:46.124302	2014-04-01 13:16:44.556403	2014-04-01 13:16:44.556403	2	\N	\N	f	\N	\N	f
2	8	2	4	2014-04-01 14:27:46.257004	2014-03-31 15:50:11.571402	2014-03-31 15:50:11.571402	2	\N	\N	f	\N	\N	f
\.


--
-- Name: post_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('post_actions_id_seq', 3, true);


--
-- Data for Name: post_details; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_details (id, post_id, key, value, extra, created_at, updated_at) FROM stdin;
\.


--
-- Name: post_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('post_details_id_seq', 1, false);


--
-- Data for Name: post_replies; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_replies (post_id, reply_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_revisions; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_revisions (id, user_id, post_id, modifications, number, created_at, updated_at) FROM stdin;
\.


--
-- Name: post_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('post_revisions_id_seq', 1, false);


--
-- Data for Name: post_search_data; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_search_data (post_id, search_data) FROM stdin;
1	'3':9 'categori':2,15 'exclus':3 'higher':11 'level':8 'loung':14,16 'member':5 'trust':7
2	'categori':19 'discuss':1 'forum':4 'improv':14 'meta':18,20 'organ':6 'work':9
3	'admin':11 'categori':2,17 'discuss':5 'moder':13 'privat':1 'staff':4,16,18 'topic':6 'visibl':9
4	'/a':1144,1151,1158,1165,1172,1177 '/about/':1149 '/admin':33 '/admin/docker':1266 '/blog':1170 '/div':1179 '/news/':1156 '/products/':1163 '/span':1178 '1':781 '2':1196 '20px':1139 '3':373,967 'abl':1208 'access':27,36 'account':318 'achiev':614 'add':156,167,179,402,413 'addit':331 'address':567,571,669 'admin':24,29,39,56,190,379,560,947,978,1336 'allow':924 'alongsid':458 'also':204,295,509,535,613,785,881,1042 'alway':401,900,908 'amazon':520 'announc':539 'anybodi':943 'appear':695,1280 'appli':1081 'approv':258,287 'area':251,271 'aren':1096 'asset':115 'assist':1317 'assum':265 'attach':526 'audienc':398 'author':137,935,936 'avail':1200 'bit':329 'blog':1171 'blog.example.com':1169 'blog.example.com/blog':1168 'bottom':1073 'box':504 'brief':733,954 'bunch':484 'button':1279 'categori':297,347,352,391,415,418,423,434,446,448,455,470,479,826,835,840,1328,1332 'caus':1049 'certain':142,303,437 'chang':77,1051,1063,1078,1101 'check':282,1033 'checkbox':1036 'chick':17,19 'civil':12 'click':31,145,421,576,1038,1067,1107 'click/tap':47 'close':588 'common':323,877 'compani':863 'compar':798 'configur':332,493,511,676,1319 'congratul':1 'consol':979 'construct':14 'contain':1232 'content':856,891,918,928,949 'continu':1309 'convers':553 'cool':101,106 'copyright':902 'correct':1249 'creat':345,388,422,457,982 'creativ':876 'critic':591 'css':974,991 'current':1088 'custom':973,981,986,989,990,998,1092,1125 'cut':960 'dashboard':25,30,40,191 'decis':888,964 'default':85,264,310,354,684 'deliver':593,617 'deploy':219 'describ':768 'descript':473 'design':119 'detail':541 'detect':213,1015 'devic':1017 'didn':597 'differ':795 'discours':13,38,94,225,244,544,691,797,1203,1259,1323,1335 'discuss':250,270,357 'ditto':1006 'div':1126 'docker':1231 'document':878 'domain':866 'done':1294 'easili':406 'edit':135,296,677,727 'effect':1029,1054 'effort':638 'either':612 'elev':760,776 'email':543,548,561,566,570,579,587,592,602,610,616,632,659,662,668 'emerg':411 'enabl':307,654,1018,1035 'enough':913 'enter':65,475,564,987 'essenti':197 'everi':260,447 'everyon':96,821 'exampl':1115 'example.com':1142,1148,1155,1162 'example.com/about/':1147 'example.com/news/':1154 'example.com/products/':1161 'except':1009 'expect':1185 'expert':1224 'explain':739 'explicit':257 'extens':138 'facebook':337 'favicon':111,125,184,187 'feedback':1314 'field':574 'file':494,527 'filetyp':143 'find':720 'fine':500,646 'follow':523 'foo':454 'forev':819 'form':324,955 'forum':118,238,278,557,649,715,737,764,770,801,896,911,921,932,942,1176,1183,1324 'forums.example.com':1175 'free':642 'fulli':248 'gb':1197 'general':229,356 'generic':91 'generous':641 'get':22,87,97,153,599,608,687 'github':341 'go':68,518,744,993,1001,1119 'good':491 'googl':319 'grant':909 'great':583 'group':304,438 'grow':1187 'guarante':1245 'guid':1299,1339 'happen':554 'happi':1098 'hard':620 'hatch':16,18 'header':975,1000,1004,1027,1122 'health':235 'heavili':546 'heck':742 'height':1138 'help':1297 'hide':804 'higher':375 'home':1143 'homepag':698 'hope':1225 'host':1331 'howev':262 'howto':525 'href':1141,1146,1153,1160,1167,1174 'html':999,1116 'huge':707 'icon':50,64 'id':1127,1132 'imag':148,496,515,531 'immedi':1055 'import':364,708,886 'improv':1310 'includ':916 'initi':392,451 'instal':1233 'instanc':1204,1264 'introduct':734 'invit':291 'item':80 'kit':15 'know':103,788,1290 'known':1043 'larger':161 'later':404 'least':1195 'legal':887 'less':1213 'let':20,958 'level':372 'licens':857,950 'like':625 'link':1070,1111,1136 'list':849 'littl':794 'live':1045 'll':349,880 'local':317,506 'log':313 'login':289,308,326 'logo':95,109,123,162,165,173,176 'look':112 'loung':365 'mail':674 'mailgun':627 'mailjet':629 'mainten':1180 'make':488,858,884 'mandril':626 'mani':390 'may':132,395,605,671 'memori':1199 'menu':46,49 'meta':355 'meta.discourse.org':1334 'metric':232 'might':1206 'minut':782 'miss':201 'mobil':1008,1016 'moder':381 'must':286 'name':864 'navbar':1130,1135 'need':133,882,1295 'new':222,346,701,984 'news':1157 'nobodi':753 'note':129 'notif':611 'notifi':550 'novel':751 'offer':640 'offici':1241 'one':60,254,492,681,1238 'optim':1256 'overwhelm':396 'owner':7,912,939 'page':419,951,1269 'panel':1093 'past':962 'pencil':92 'peopl':311,551 'per':433 'per-categori':432 'perk':367 'pin':464,790,805,818,822,836,842 'pitch':761 'place':207,486 'plan':643 'pleas':944 'post':151,533,893,905,929 'press':1281 'preview':1056,1061,1069,1110 'privat':241,253,277 'problem':211 'product':1164 'progress':1304 'proper':615 'proud':6 'public':243,249,269 'quick':1337 're':200,1293 'read':537,584,755,811 'recategor':407 'recommend':623,1218,1255 'refresh':1267 'releas':228 'reli':545 'reload':1046 'repli':655,666 'republish':926 'requir':66,71,256,290,327,672 'retain':901 'revert':1105 'right':54,144,427,914 'rubi':1252 'run':1228,1321 's3':521 'save':1039,1065,1089 'screen':1076 'screenshot':336,340,344 'section':664,966,997,1005,1123 'secur':431 'see':209,442,660,945,1276,1325 'select':55,980 'send':577 'server':675 'servic':854,872,972 'set':67,75,139,198,217,285,430,562,663,850,861 'show':1012 'simpli':1106 'site':216,360,985,1032,1084 'small':177,648 'smaller':172 'solv':631 'someth':624 'span':1131 'specif':665 'squeak':1210 'staff':376,378,385,1340 'standard':90 'start':23,1338 'stat':230 'stay':817 'stick':829 'store':505 'stranger':773 'strong':622 'style':992,1025,1137 'stylesheet':996 'support':536,1242,1327 'sure':280,859,1191 'tab':72 'take':1028,1053 'talk':784 'tast':83 'team':1260 'tell':710 'term':852,870,970 'test':542,573,578,586,601 'text':1288 'three':351 'time':43,1272 'tip':594 'top':467,832,845,1129,1134 'top-navbar':1128 'top-navbar-link':1133 'topic':120,128,408,443,456,461,657,680,685,693,705,729,791,807,823,837,848 'trust':371 'twitter':333 'type':528 'undo':1109 'unless':1220 'updat':1287 'upgrad':1262,1278 'upload':121,141,495,497,517 'upper':53,426 'url':155,158,166,169,178,181,188 'use':206,481 'user':261,288,306,369,440,516,604,702,802,892,898,948 'variabl':867 'version':223,1250 'via':44,658 'virtual':636 'visibl':301,382 'visit':416,558,725,1265 'visitor':711 'wait':1284 'walkthrough':334,338,342 'want':267,274,652 'warn':193 'welcom':679,689,704 'wish':1021,1059,1103 'within':1124 'work':245,499,582,645,792,1302 'would':766,1118 'wrench':63 'write':731,749 'yahoo':321
5	'asset':8,18 'delet':16 'design':13,22 'forum':7,12,21 'staff':23 'store':6 'topic':4 'use':9
6	'announc':79 'brief':28 'close':59 'come':45 'descript':29 'discours':82 'edit':24 'etc':54 'find':40 'first':2 'forum':32 'homepag':20 'icon':65 'import':23 'intro':13 'link':52 'may':56 'messag':14 'new':16 'paragraph':3 'pile':75 'pin':6 'read':50 'repli':72 'resourc':53 'right':69 'topic':7,61 'uncategor':83 'upper':68 'user':17 'via':62 'visibl':10 'want':57 'welcom':80 'wrench':64
7	'bad':10 'discours':13 'look':8 'ohai':1 'repli':5 'uncategor':14 'welcom':11
8	'actual':3 'bit':16 'discours':8 'fuck':6 'like':4,29 'littl':15 'loung':31 'one':2 'peopl':28 'requiremtwr':20 'ridicul':19 'serious':11 'smkdadfshmlkf':22 'tg':21 'topic':26
9	'200':28 'alreadi':97 'anoth':109 'appear':16,42 'area':21 'categori':12,19,39,45,61,77,84,95,103,110,116,122 'charact':29 'conceiv':121,125 'consid':68 'creat':36 'descript':8,54 'differ':91 'discuss':71 'edit':32 'establish':59 'first':3 'follow':49 'guidanc':14 'guidelin':62 'keep':25 'longer':53 'merg':106 'need':101 'new':11 'page':46 'paragraph':4,50 'peopl':81 'replac':1 'repli':72 'rule':64 'select':20,82 'short':7 'split':112 'text':34 'thing':66 'topic':37,87 'tri':23,119,123 'use':47 'well':56 'won':40
10	'access':20 'categori':32 'conceiv':31,35 'direct':25 'display':11 'invis':5 'link':26 'list':15 'longer':9 'topic':2,14,22 'tri':29,33 'via':24 'way':18
11	'200':28 'alreadi':97 'anoth':109 'appear':16,42 'area':21 'avoid':121,125 'categori':12,19,39,45,61,77,84,95,103,110,116,122 'charact':29 'consid':68 'creat':36 'descript':8,54 'differ':91 'discuss':71 'edit':32 'establish':59 'first':3 'follow':49 'guidanc':14 'guidelin':62 'keep':25 'longer':53 'merg':106 'need':101 'new':11 'page':46 'paragraph':4,50 'peopl':81 'replac':1 'repli':72 'rule':64 'select':20,82 'short':7 'split':112 'text':34 'thing':66 'topic':37,87 'tri':23,119,123 'use':47 'well':56 'won':40
12	'access':20 'avoid':31,35 'categori':32 'direct':25 'display':11 'invis':5 'link':26 'list':15 'longer':9 'topic':2,14,22 'tri':29,33 'via':24 'way':18
13	'200':28 'alreadi':97 'anoth':109 'appear':16,42 'area':21 'categori':12,19,39,45,61,77,84,95,103,110,116,123 'charact':29 'consid':68 'creat':36 'descript':8,54 'differ':91 'discuss':71 'edit':32 'establish':59 'first':3 'follow':49 'good':121,126 'guidanc':14 'guidelin':62 'keep':25 'longer':53 'merg':106 'need':101 'new':11 'news':122,127 'page':46 'paragraph':4,50 'peopl':81 'replac':1 'repli':72 'rule':64 'select':20,82 'share':119,124 'short':7 'split':112 'text':34 'thing':66 'topic':37,87 'tri':23 'use':47 'well':56 'won':40
14	'access':20 'categori':33 'direct':25 'display':11 'good':31,36 'invis':5 'link':26 'list':15 'longer':9 'news':32,37 'share':29,34 'topic':2,14,22 'via':24 'way':18
15	'200':28 'alreadi':97 'anoth':109 'appear':16,42 'area':21 'categori':12,19,39,45,61,77,84,95,103,110,116,121 'charact':29 'consid':68 'creat':36 'descript':8,54 'differ':91 'discuss':71 'edit':32 'establish':59 'fertil':119,122 'first':3 'follow':49 'guidanc':14 'guidelin':62 'keep':25 'longer':53 'merg':106 'need':101 'new':11 'page':46 'paragraph':4,50 'peopl':81 'question':120,123 'replac':1 'repli':72 'rule':64 'select':20,82 'short':7 'split':112 'text':34 'thing':66 'topic':37,87 'tri':23 'use':47 'well':56 'won':40
16	'access':20 'categori':31 'direct':25 'display':11 'fertil':29,32 'invis':5 'link':26 'list':15 'longer':9 'question':30,33 'topic':2,14,22 'via':24 'way':18
17	'ahjksdg':2 'asdjfhagsdjfhgajhkf':1 'conceiv':30 'concept':22 'dfhjkas':20 'dfjkhasg':18 'dfkjahsg':11 'fjahksg':17 'fjkahsgd':5,16 'fjkhasg':19 'fjkhasgd':3,4 'fkahjsg':9 'fkjahsg':12 'fkjhasd':13 'fkjhasg':6,7,10 'fkjhasgd':8,15 'gdf':21 'gfkjahsgd':14 'happen':27 'thing':25 'tri':28
18	'complet':6 'export':2,5 'success':4,7
19	'asdfhjaklsdfhajkl':5 'askdjhfaksjdhfaklsjdfhaakjshfajkl':1 'conceiv':10 'kljashdf':3,4 'lkdjfh':7 'sdfhas':6 'sdhfjklasdhf':2 'tri':8
20	'categori':9 'conceiv':8,12 'someth':2,3 'tri':6,10 'zomg':1
21	'complet':6 'export':2,5 'success':4,7
22	'complet':6 'export':2,5 'success':4,7
\.


--
-- Data for Name: post_timings; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_timings (topic_id, post_number, user_id, msecs) FROM stdin;
6	2	2	58321
14	1	2	756399
5	1	2	20114
12	2	2	13012
6	1	2	179298
1	1	2	25136
12	1	2	62238
4	1	2	5007
11	1	2	4009
13	1	2	4005
15	1	2	14023
9	1	2	28539
17	1	2	10949
16	1	2	5009
10	1	2	852389
10	2	2	425941
10	3	2	68076
\.


--
-- Data for Name: post_uploads; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY post_uploads (id, post_id, upload_id) FROM stdin;
\.


--
-- Name: post_uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('post_uploads_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY posts (id, user_id, topic_id, post_number, raw, cooked, created_at, updated_at, reply_to_post_number, reply_count, quote_count, deleted_at, off_topic_count, like_count, incoming_link_count, bookmark_count, avg_time, score, reads, post_type, vote_count, sort_order, last_editor_id, hidden, hidden_reason_id, notify_moderators_count, spam_count, illegal_count, inappropriate_count, last_version_at, user_deleted, reply_to_user_id, percent_rank, notify_user_count, like_score, deleted_by_id, edit_reason, word_count, version, cook_method) FROM stdin;
2	-1	2	1	Discussion about this forum, its organization, how it works, and how we can improve it.	<p>Discussion about this forum, its organization, how it works, and how we can improve it.</p>	2014-03-31 15:09:51.82422	2014-03-31 15:09:51.82422	\N	0	0	\N	0	0	0	0	\N	0	0	1	0	1	-1	f	\N	0	0	0	0	2014-03-31 15:09:51.827241	f	\N	0	0	0	\N	\N	15	1	1
3	-1	3	1	Private category for staff discussions. Topics are only visible to admins and moderators.	<p>Private category for staff discussions. Topics are only visible to admins and moderators.</p>	2014-03-31 15:09:51.909435	2014-03-31 15:09:51.909435	\N	0	0	\N	0	0	0	0	\N	0	0	1	0	1	-1	f	\N	0	0	0	0	2014-03-31 15:09:51.91265	f	\N	0	0	0	\N	\N	13	1	1
4	-1	4	1	Congratulations, you are now the proud owner of your very own [Civilized Discourse Construction Kit](http://www.discourse.org). :hatching_chick:\n\nLet's get started!\n\n### Admin Dashboard\n\nTo access the admin dashboard, click here:\n\n[**/admin**](/admin)\n\nYou can access the Discourse admin dashboard at any time via the menu:\n\n1. Click/tap the menu icon at the upper right.\n2. Select Admin (it's the one with the wrench icon).\n\n### Enter Required Settings\n\nGo to the [Required tab](/admin/site_settings/category/required) of the Settings and change all the items there to taste.\n\nBy default you get the same standard generic "penciled in" Discourse logo everyone gets. That's not cool. You know what's cool? Your own logos and favicons. Look for the [**Assets for the forum design**](/t/assets-for-the-forum-design/5) topic. Upload your logos and favicon to that topic. (Note that you may need to edit the `authorized_extensions` setting to upload certain filetypes.)\n\nRight click on the images in the post to get their URLs:\n\n- Add the URL of the larger logo to the `logo_url`\n- Add the URL of the smaller logo to the `logo_small_url`\n- Add the URL of your favicon to the `favicon_url`\n\nThe admin dashboard will warn you about any essential settings you're missing. It's also a useful place to see:\n\n- If problems are detected with your site settings or deployment\n- If a new version of Discourse has been released\n- General stats and metrics about the health of your forum\n\n### Is this private or public?\n\nDiscourse works for both fully public discussion areas, and private ones that require explicit approval of every user. However, the defaults assume you want a public discussion area.\n\nIf you want a more private forum, be sure to check out these settings:\n\n- `must_approve_users`\n- `login_required`\n- `invite_only`\n\nYou can also edit categories to only be visible to certain groups of users.\n\n### Enable Logins\n\nBy default, people can log in here with local accounts, Google, or Yahoo. Some common forms of login require a bit of additional configuration: &hellip;\n\n- **Twitter** &rarr; [walkthrough with screenshots](https://meta.discourse.org/t/configuring-twitter-login-for-discourse/13395)\n- **Facebook** &rarr; [walkthrough with screenshots](https://meta.discourse.org/t/configuring-facebook-login-for-discourse/13394)\n- **GitHub** &rarr; [walkthrough with screenshots](https://meta.discourse.org/t/configuring-github-login-for-discourse/13745)\n\n### Creating New Categories\n\nYou'll have three categories by default\n\n1. [meta](/category/meta) – general discussion about the site itself. [It's important!](https://meta.discourse.org/t/what-is-meta/5249)\n2. [lounge](/category/lounge) – a perk for users at trust level 3 and higher\n3. [staff](/category/staff) – for staff (admins and moderators), visible only to staff\n\nDon't create too many categories initially, as it may overwhelm your audience. You can always add more later, and easily recategorize topics as they emerge.\n\nTo add a category, visit the [categories page](/categories), then click Create Category at the upper right. You can set security per-category so only certain groups of users can see topics in that category.\n\nEvery category has an initial "About the {foo} category" topic created alongside it. This topic will be pinned to the top of the category, and the description you enter here for the category will used in a bunch of places. So make it a good one!\n\n### Configure File Uploads\n\nImage uploads should work fine out of the box stored locally. You can also can configure it so that images users upload go to Amazon S3 by [following this howto](http://meta.discourse.org/t/how-to-set-up-image-uploads-to-s3/7229).\n\nAttaching file types other than images to posts is also supported, read [the announcement](http://meta.discourse.org/t/new-attachments/8609) for details.\n\n### Test Email\n\nDiscourse relies heavily on emails to notify people about conversations happening on the forum. Visit [the admin email settings](/admin/email), then enter an email address in the "email address to test" field and click <kbd>send test email</kbd>.\n\nDid it work? Great! **Read this test email closely**, it has critical email deliverability tips. If you didn't get the test email, your users may not be getting any email notifications, either.\n\nAlso, achieving proper email deliverability can be hard. We strongly recommend something like [Mandrill](http://mandrill.com), [MailGun](http://www.mailgun.com/), or [MailJet](http://www.mailjet.com/), which solve email for you with virtually no effort, and offer generous free plans that works fine for small forums.\n\nIf you want to enable replying to topics via email, see the email settings section, specifically `reply_by_email_address`. This may require some mail server configuration.\n\n### Edit the Welcome topic\n\nOne of the default topics you get is [Welcome to Discourse](/t/welcome-to-discourse). This topic will appear on the homepage for all new users. Your welcome topic is hugely important – it tells visitors\n\n- Who is this forum for? \n- What can they find here?\n- Why should they visit here?\n\nEdit this topic and write a **brief introduction for your forum** that explains what the heck is going on here. Don't write a novel because nobody will read it. What is the "elevator pitch" for your forum? How would you describe this forum to a stranger on an elevator when you have about 1 minute to talk?\n\nAlso, you should know that **pinning topics works a little differently in Discourse** compared to other forums.\n\n- Users can hide pins on topics once they have read them, so they don't stay pinned forever for everyone.\n- Pinned topics with a category will only "stick" to the top of their category.\n- Pinned topics with no category are pinned to the top of all topic lists.\n\n### Set your Terms of Service and Content Licensing\n\nMake sure you set your company name and domain variables for the [Terms of Service](/tos), which is a creative commons document.\n\nYou'll also need to make an important legal decision about the content users post on your forum:\n\n> Your users will always retain copyright on their posts, and will always grant the forum owner enough rights to include their content on the forum.\n>\n> Who is allowed to republish the content posted on this forum?\n>\n> - Only the author\n> - Author and the owner of this forum\n> - Anybody\n\nPlease see our [admin User Content Licensing](/admin/site_contents/tos_user_content_license) page for a brief form that will let you cut and paste your decision into section #3 of the [Terms of Service](/tos#3).\n\n### Customize CSS / Headers\n\n1. In the admin console, select "Customize".\n\n2. Create a new site customization.\n\n3. Enter a customization:\n  - Custom CSS styles go in the "Stylesheet" section.\n  - Custom HTML headers go in the "Header" section.\n  - Ditto for mobile, except these only show up on detected mobile devices.\n\n3. **Enable:** If you wish to have your styles and header take effect on the site, check the "Enable" checkbox, then click "Save". This is also known as "live reloading", which will cause your changes to take effect immediately.\n\n4. **Preview:** If you wish to preview your changes before saving them, click the "preview" link at the bottom of the screen. Your changes will be applied to the site as they are currently saved in the "Customize" panel. If you aren't happy with your changes and wish to revert, simply click the "Undo Preview" link.\n\nHere is some example HTML that would go into the "Header" section within "Customize":\n\n```\n<div id="top-navbar">\n<span id="top-navbar-links" style="height:20px;">\n  <a href="http://example.com">Home</a>\n  <a href="http://example.com/about/">About</a>\n  <a href="http://example.com/news/">News</a>\n  <a href="http://example.com/products/">Products</a>\n  <a href="http://blog.example.com/blog">Blog</a>\n  <a href="http://forums.example.com/">Forums</a>\n</span>\n</div>\n```\n\n### Maintenance\n\n- If your forum is expected to grow at all, be sure you have at least 2 GB of memory available to your Discourse instance. You might be able to squeak by with less, but we don't recommend it, unless you are an expert. \n\n- Hopefully you are running [in our Docker container install](https://github.com/discourse/discourse/blob/master/docs/INSTALL.md); it's the only one we can officially support. That will guarantee you have the correct version of Ruby and all recommended optimizations from the Discourse team.\n\n- To upgrade your instance, visit [/admin/docker](/admin/docker). Refresh the page a few times, and you will see an <kbd>upgrade</kbd> button appear. Press it! Then wait for the updating text to know when you're done.\n\n### Need more Help?\n\nThis guide is a [work in progress](https://github.com/discourse/discourse/blob/master/docs/ADMIN-QUICK-START-GUIDE.md) and we will be continually improving it with your feedback.\n\nFor more assistance on configuring and running your Discourse forum, see [the support category](http://meta.discourse.org/category/support) or [the hosting category](http://meta.discourse.org/category/hosting) on [meta.discourse.org](http://meta.discourse.org).\n	<p>Congratulations, you are now the proud owner of your very own <a href="http://www.discourse.org">Civilized Discourse Construction Kit</a>. <img src="//localhost:3000/plugins/emoji/images/hatching_chick.png" title=":hatching_chick:" class="emoji" alt="hatching_chick" width="" height=""></p>\n\n<p>Let's get started!</p>\n\n<h3>Admin Dashboard</h3>\n\n<p>To access the admin dashboard, click here:</p>\n\n<p><a href="/admin"><strong>/admin</strong></a></p>\n\n<p>You can access the Discourse admin dashboard at any time via the menu:</p>\n\n<ol>\n<li>Click/tap the menu icon at the upper right.</li>\n<li>Select Admin (it's the one with the wrench icon).</li>\n</ol><h3>Enter Required Settings</h3>\n\n<p>Go to the <a href="/admin/site_settings/category/required">Required tab</a> of the Settings and change all the items there to taste.</p>\n\n<p>By default you get the same standard generic "penciled in" Discourse logo everyone gets. That's not cool. You know what's cool? Your own logos and favicons. Look for the <a href="/t/assets-for-the-forum-design/5"><strong>Assets for the forum design</strong></a> topic. Upload your logos and favicon to that topic. (Note that you may need to edit the <code>authorized_extensions</code> setting to upload certain filetypes.)</p>\n\n<p>Right click on the images in the post to get their URLs:</p>\n\n<ul>\n<li>Add the URL of the larger logo to the <code>logo_url</code>\n</li>\n<li>Add the URL of the smaller logo to the <code>logo_small_url</code>\n</li>\n<li>Add the URL of your favicon to the <code>favicon_url</code>\n</li>\n</ul><p>The admin dashboard will warn you about any essential settings you're missing. It's also a useful place to see:</p>\n\n<ul>\n<li>If problems are detected with your site settings or deployment</li>\n<li>If a new version of Discourse has been released</li>\n<li>General stats and metrics about the health of your forum</li>\n</ul><h3>Is this private or public?</h3>\n\n<p>Discourse works for both fully public discussion areas, and private ones that require explicit approval of every user. However, the defaults assume you want a public discussion area.</p>\n\n<p>If you want a more private forum, be sure to check out these settings:</p>\n\n<ul>\n<li><code>must_approve_users</code></li>\n<li><code>login_required</code></li>\n<li><code>invite_only</code></li>\n</ul><p>You can also edit categories to only be visible to certain groups of users.</p>\n\n<h3>Enable Logins</h3>\n\n<p>By default, people can log in here with local accounts, Google, or Yahoo. Some common forms of login require a bit of additional configuration: …</p>\n\n<ul>\n<li>\n<strong>Twitter</strong> → <a href="https://meta.discourse.org/t/configuring-twitter-login-for-discourse/13395">walkthrough with screenshots</a>\n</li>\n<li>\n<strong>Facebook</strong> → <a href="https://meta.discourse.org/t/configuring-facebook-login-for-discourse/13394">walkthrough with screenshots</a>\n</li>\n<li>\n<strong>GitHub</strong> → <a href="https://meta.discourse.org/t/configuring-github-login-for-discourse/13745">walkthrough with screenshots</a>\n</li>\n</ul><h3>Creating New Categories</h3>\n\n<p>You'll have three categories by default</p>\n\n<ol>\n<li>\n<a href="/category/meta">meta</a> – general discussion about the site itself. <a href="https://meta.discourse.org/t/what-is-meta/5249">It's important!</a>\n</li>\n<li>\n<a href="/category/lounge">lounge</a> – a perk for users at trust level 3 and higher</li>\n<li>\n<a href="/category/staff">staff</a> – for staff (admins and moderators), visible only to staff</li>\n</ol><p>Don't create too many categories initially, as it may overwhelm your audience. You can always add more later, and easily recategorize topics as they emerge.</p>\n\n<p>To add a category, visit the <a href="/categories">categories page</a>, then click Create Category at the upper right. You can set security per-category so only certain groups of users can see topics in that category.</p>\n\n<p>Every category has an initial "About the {foo} category" topic created alongside it. This topic will be pinned to the top of the category, and the description you enter here for the category will used in a bunch of places. So make it a good one!</p>\n\n<h3>Configure File Uploads</h3>\n\n<p>Image uploads should work fine out of the box stored locally. You can also can configure it so that images users upload go to Amazon S3 by <a href="http://meta.discourse.org/t/how-to-set-up-image-uploads-to-s3/7229">following this howto</a>.</p>\n\n<p>Attaching file types other than images to posts is also supported, read <a href="http://meta.discourse.org/t/new-attachments/8609">the announcement</a> for details.</p>\n\n<h3>Test Email</h3>\n\n<p>Discourse relies heavily on emails to notify people about conversations happening on the forum. Visit <a href="/admin/email">the admin email settings</a>, then enter an email address in the "email address to test" field and click <kbd>send test email</kbd>.</p>\n\n<p>Did it work? Great! <strong>Read this test email closely</strong>, it has critical email deliverability tips. If you didn't get the test email, your users may not be getting any email notifications, either.</p>\n\n<p>Also, achieving proper email deliverability can be hard. We strongly recommend something like <a href="http://mandrill.com">Mandrill</a>, <a href="http://www.mailgun.com/">MailGun</a>, or <a href="http://www.mailjet.com/">MailJet</a>, which solve email for you with virtually no effort, and offer generous free plans that works fine for small forums.</p>\n\n<p>If you want to enable replying to topics via email, see the email settings section, specifically <code>reply_by_email_address</code>. This may require some mail server configuration.</p>\n\n<h3>Edit the Welcome topic</h3>\n\n<p>One of the default topics you get is <a href="/t/welcome-to-discourse">Welcome to Discourse</a>. This topic will appear on the homepage for all new users. Your welcome topic is hugely important – it tells visitors</p>\n\n<ul>\n<li>Who is this forum for? </li>\n<li>What can they find here?</li>\n<li>Why should they visit here?</li>\n</ul><p>Edit this topic and write a <strong>brief introduction for your forum</strong> that explains what the heck is going on here. Don't write a novel because nobody will read it. What is the "elevator pitch" for your forum? How would you describe this forum to a stranger on an elevator when you have about 1 minute to talk?</p>\n\n<p>Also, you should know that <strong>pinning topics works a little differently in Discourse</strong> compared to other forums.</p>\n\n<ul>\n<li>Users can hide pins on topics once they have read them, so they don't stay pinned forever for everyone.</li>\n<li>Pinned topics with a category will only "stick" to the top of their category.</li>\n<li>Pinned topics with no category are pinned to the top of all topic lists.</li>\n</ul><h3>Set your Terms of Service and Content Licensing</h3>\n\n<p>Make sure you set your company name and domain variables for the <a href="/tos">Terms of Service</a>, which is a creative commons document.</p>\n\n<p>You'll also need to make an important legal decision about the content users post on your forum:</p>\n\n<blockquote>\n<p>Your users will always retain copyright on their posts, and will always grant the forum owner enough rights to include their content on the forum.</p>\n<p>Who is allowed to republish the content posted on this forum?</p>\n<ul>\n<li>Only the author</li>\n<li>Author and the owner of this forum</li>\n<li>Anybody</li>\n</ul>\n</blockquote>\n\n<p>Please see our <a href="/admin/site_contents/tos_user_content_license">admin User Content Licensing</a> page for a brief form that will let you cut and paste your decision into section #3 of the <a href="/tos#3">Terms of Service</a>.</p>\n\n<h3>Customize CSS / Headers</h3>\n\n<ol>\n<li><p>In the admin console, select "Customize".</p></li>\n<li><p>Create a new site customization.</p></li>\n<li>\n<p>Enter a customization:</p>\n<ul>\n<li>Custom CSS styles go in the "Stylesheet" section.</li>\n<li>Custom HTML headers go in the "Header" section.</li>\n<li>Ditto for mobile, except these only show up on detected mobile devices.</li>\n</ul>\n</li>\n<li><p><strong>Enable:</strong> If you wish to have your styles and header take effect on the site, check the "Enable" checkbox, then click "Save". This is also known as "live reloading", which will cause your changes to take effect immediately.</p></li>\n<li><p><strong>Preview:</strong> If you wish to preview your changes before saving them, click the "preview" link at the bottom of the screen. Your changes will be applied to the site as they are currently saved in the "Customize" panel. If you aren't happy with your changes and wish to revert, simply click the "Undo Preview" link.</p></li>\n</ol><p>Here is some example HTML that would go into the "Header" section within "Customize":</p>\n\n<p></p><pre><code class="lang-auto">&lt;div id="top-navbar"&gt;\n&lt;span id="top-navbar-links" style="height:20px;"&gt;\n  &lt;a href="http://example.com"&gt;Home&lt;/a&gt;\n  &lt;a href="http://example.com/about/"&gt;About&lt;/a&gt;\n  &lt;a href="http://example.com/news/"&gt;News&lt;/a&gt;\n  &lt;a href="http://example.com/products/"&gt;Products&lt;/a&gt;\n  &lt;a href="http://blog.example.com/blog"&gt;Blog&lt;/a&gt;\n  &lt;a href="http://forums.example.com/"&gt;Forums&lt;/a&gt;\n&lt;/span&gt;\n&lt;/div&gt;</code></pre>\n\n<h3>Maintenance</h3>\n\n<ul>\n<li><p>If your forum is expected to grow at all, be sure you have at least 2 GB of memory available to your Discourse instance. You might be able to squeak by with less, but we don't recommend it, unless you are an expert. </p></li>\n<li><p>Hopefully you are running <a href="https://github.com/discourse/discourse/blob/master/docs/INSTALL.md">in our Docker container install</a>; it's the only one we can officially support. That will guarantee you have the correct version of Ruby and all recommended optimizations from the Discourse team.</p></li>\n<li><p>To upgrade your instance, visit <a href="/admin/docker">/admin/docker</a>. Refresh the page a few times, and you will see an <kbd>upgrade</kbd> button appear. Press it! Then wait for the updating text to know when you're done.</p></li>\n</ul><h3>Need more Help?</h3>\n\n<p>This guide is a <a href="https://github.com/discourse/discourse/blob/master/docs/ADMIN-QUICK-START-GUIDE.md">work in progress</a> and we will be continually improving it with your feedback.</p>\n\n<p>For more assistance on configuring and running your Discourse forum, see <a href="http://meta.discourse.org/category/support">the support category</a> or <a href="http://meta.discourse.org/category/hosting">the hosting category</a> on <a href="http://meta.discourse.org">meta.discourse.org</a>.</p>	2014-03-31 15:09:52.315443	2014-03-31 15:09:52.315443	\N	0	0	\N	0	0	0	0	5	0.450000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2014-03-31 15:09:52.338184	f	\N	0	0	0	\N	\N	1499	1	1
10	2	10	2	This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.	<p>This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.</p>	2014-03-31 16:36:54.26937	2014-03-31 16:36:54.26937	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	2	0	2	2	f	\N	0	0	0	0	2014-03-31 16:36:54.272959	f	\N	0	0	0	\N	\N	26	1	1
7	2	6	2	Ohai, this is a reply and it looks not bad.	<p>Ohai, this is a reply and it looks not bad.</p>	2014-03-31 15:44:58.389659	2014-03-31 15:44:58.389659	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	2	2	f	\N	0	0	0	0	2014-03-31 15:44:58.393272	f	\N	1	0	0	\N	\N	10	1	1
14	2	12	2	This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.	<p>This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.</p>	2014-03-31 16:38:53.988872	2014-03-31 16:38:53.988872	\N	0	0	\N	0	0	0	0	\N	0	1	2	0	2	2	f	\N	0	0	0	0	2014-03-31 16:38:53.99319	f	\N	1	0	0	\N	\N	26	1	1
17	2	14	1	asdjfhagsdjfhgajhkf ahjksdg fjkhasgd fjkhasgd fjkahsgd fkjhasg fkjhasg fkjhasgd fkahjsg fkjhasg dfkjahsg fkjahsg fkjhasd gfkjahsgd fkjhasgd fjkahsgd fjahksg dfjkhasg fjkhasg dfhjkas gdf	<p>asdjfhagsdjfhgajhkf ahjksdg fjkhasgd fjkhasgd fjkahsgd fkjhasg fkjhasg fkjhasgd fkahjsg fkjhasg dfkjahsg fkjahsg fkjhasd gfkjahsgd fkjhasgd fjkahsgd fjahksg dfjkhasg fjkhasg dfhjkas gdf</p>	2014-03-31 19:23:07.523647	2014-03-31 19:23:07.523647	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	2	f	\N	0	0	0	0	2014-03-31 19:23:07.527307	f	\N	0	0	0	\N	\N	21	1	1
13	2	12	1	[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]\n\nUse the following paragraphs for a longer description, as well as to establish any category guidelines or rules.\n\nSome things to consider in any discussion replies below:\n\n- What is this category for? Why should people select this category for their topic?\n\n- How is this different than the other categories we already have?\n\n- Do we need this category?\n\n- Should we merge this with another category, or split it into more categories?\n	<p>[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]</p>\n\n<p>Use the following paragraphs for a longer description, as well as to establish any category guidelines or rules.</p>\n\n<p>Some things to consider in any discussion replies below:</p>\n\n<ul><li><p>What is this category for? Why should people select this category for their topic?</p></li><li><p>How is this different than the other categories we already have?</p></li><li><p>Do we need this category?</p></li><li><p>Should we merge this with another category, or split it into more categories?</p></li></ul>	2014-03-31 16:38:40.05195	2014-03-31 16:38:40.05195	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	2	f	\N	0	0	0	0	2014-03-31 16:38:40.055226	f	\N	0	0	0	\N	\N	116	1	1
19	2	16	1	askdjhfaksjdhfaklsjdfhaakjshfajkl sdhfjklasdhf kljashdf kljashdf 	<p>askdjhfaksjdhfaklsjdfhaakjshfajkl sdhfjklasdhf kljashdf kljashdf </p>	2014-04-01 15:59:55.048992	2014-04-01 15:59:55.048992	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	2	f	\N	0	0	0	0	2014-04-01 15:59:55.052847	f	\N	0	0	0	\N	\N	4	1	1
6	-1	6	1	The first paragraph of this pinned topic will be visible as an intro message to new users on the homepage. It's important!\n\nEdit this into a brief description of your forum:\n\n- Who is it for?\n- What can they find here?\n- Why should they come here?\n- Where can they read more (links, resources, etc)?\n\nYou may want to close this topic via the wrench icon at the upper right, so that replies don't pile up on an announcement.	<p>The first paragraph of this pinned topic will be visible as an intro message to new users on the homepage. It's important!</p>\n\n<p>Edit this into a brief description of your forum:</p>\n\n<ul>\n<li>Who is it for?</li>\n<li>What can they find here?</li>\n<li>Why should they come here?</li>\n<li>Where can they read more (links, resources, etc)?</li>\n</ul><p>You may want to close this topic via the wrench icon at the upper right, so that replies don't pile up on an announcement.</p>	2014-03-31 15:09:52.900193	2014-03-31 15:09:52.900193	\N	0	0	\N	0	0	0	0	179	9.15000000000000036	1	1	0	1	-1	f	\N	0	0	0	0	2014-03-31 15:09:52.903125	f	\N	0	0	0	\N	\N	79	1	1
12	2	11	2	This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.	<p>This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.</p>	2014-03-31 16:37:57.728195	2014-03-31 16:37:57.728195	\N	0	0	\N	0	0	0	0	\N	0	0	2	0	2	2	f	\N	0	0	0	0	2014-03-31 16:37:57.733642	f	\N	1	0	0	\N	\N	26	1	1
16	2	13	2	This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.	<p>This topic is now invisible. It will no longer be displayed in any topic lists. The only way to access this topic is via direct link.</p>	2014-03-31 16:40:48.154755	2014-03-31 16:40:48.154755	\N	0	0	\N	0	0	0	0	\N	0	0	2	0	2	2	f	\N	0	0	0	0	2014-03-31 16:40:48.158239	f	\N	1	0	0	\N	\N	26	1	1
11	2	11	1	[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]\n\nUse the following paragraphs for a longer description, as well as to establish any category guidelines or rules.\n\nSome things to consider in any discussion replies below:\n\n- What is this category for? Why should people select this category for their topic?\n\n- How is this different than the other categories we already have?\n\n- Do we need this category?\n\n- Should we merge this with another category, or split it into more categories?\n	<p>[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]</p>\n\n<p>Use the following paragraphs for a longer description, as well as to establish any category guidelines or rules.</p>\n\n<p>Some things to consider in any discussion replies below:</p>\n\n<ul><li><p>What is this category for? Why should people select this category for their topic?</p></li><li><p>How is this different than the other categories we already have?</p></li><li><p>Do we need this category?</p></li><li><p>Should we merge this with another category, or split it into more categories?</p></li></ul>	2014-03-31 16:37:40.056069	2014-03-31 16:37:40.056069	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	2	f	\N	0	0	0	0	2014-03-31 16:37:40.059973	f	\N	0	0	0	\N	\N	116	1	1
9	2	10	1	[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]\n\nUse the following paragraphs for a longer description, as well as to establish any category guidelines or rules.\n\nSome things to consider in any discussion replies below:\n\n- What is this category for? Why should people select this category for their topic?\n\n- How is this different than the other categories we already have?\n\n- Do we need this category?\n\n- Should we merge this with another category, or split it into more categories?\n	<p>[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]</p>\n\n<p>Use the following paragraphs for a longer description, as well as to establish any category guidelines or rules.</p>\n\n<p>Some things to consider in any discussion replies below:</p>\n\n<ul><li><p>What is this category for? Why should people select this category for their topic?</p></li><li><p>How is this different than the other categories we already have?</p></li><li><p>Do we need this category?</p></li><li><p>Should we merge this with another category, or split it into more categories?</p></li></ul>	2014-03-31 16:36:15.206165	2014-03-31 16:36:15.206165	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	2	f	\N	0	0	0	0	2014-03-31 16:36:15.209527	f	\N	0	0	0	\N	\N	116	1	1
8	2	9	1	NO ONE ACTUALLY LIKE ME\n\nFUCK OFF DISCOURSE\n\nIn all seriousness, this is a little bit of a ridiculous requiremtwr tg smkdadfshmlkf	<p>NO ONE ACTUALLY LIKE ME</p>\n\n<p>FUCK OFF DISCOURSE</p>\n\n<p>In all seriousness, this is a little bit of a ridiculous requiremtwr tg smkdadfshmlkf</p>	2014-03-31 15:50:05.322876	2014-03-31 15:50:05.322876	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	2	f	\N	0	0	0	0	2014-03-31 15:50:05.325725	f	\N	0	0	0	\N	\N	22	1	1
1	-1	1	1	A category exclusive to members with trust level 3 and higher.	<p>A category exclusive to members with trust level 3 and higher.</p>	2014-03-31 15:09:51.584152	2014-03-31 15:09:51.584152	\N	0	0	\N	0	0	0	0	25	1.44999999999999996	1	1	0	1	-1	f	\N	0	0	0	0	2014-03-31 15:09:51.595435	f	\N	0	0	0	\N	\N	11	1	1
5	-1	5	1	This is a topic to store forum assets used in the forum design. Don't delete it!	<p>This is a topic to store forum assets used in the forum design. Don't delete it!</p>	2014-03-31 15:09:52.844824	2014-03-31 15:09:52.844824	\N	0	0	\N	0	0	0	0	20	1.19999999999999996	1	1	0	1	-1	f	\N	0	0	0	0	2014-03-31 15:09:52.848012	f	\N	0	0	0	\N	\N	17	1	1
15	2	13	1	[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]\n\nUse the following paragraphs for a longer description, as well as to establish any category guidelines or rules.\n\nSome things to consider in any discussion replies below:\n\n- What is this category for? Why should people select this category for their topic?\n\n- How is this different than the other categories we already have?\n\n- Do we need this category?\n\n- Should we merge this with another category, or split it into more categories?\n	<p>[Replace this first paragraph with a short description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this text or create topics, this category won't appear on the categories page.]</p>\n\n<p>Use the following paragraphs for a longer description, as well as to establish any category guidelines or rules.</p>\n\n<p>Some things to consider in any discussion replies below:</p>\n\n<ul><li><p>What is this category for? Why should people select this category for their topic?</p></li><li><p>How is this different than the other categories we already have?</p></li><li><p>Do we need this category?</p></li><li><p>Should we merge this with another category, or split it into more categories?</p></li></ul>	2014-03-31 16:40:36.499674	2014-03-31 16:40:36.499674	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	2	f	\N	0	0	0	0	2014-03-31 16:40:36.503249	f	\N	0	0	0	\N	\N	116	1	1
20	2	10	3	zomg something something	<p>zomg something something</p>	2014-04-01 16:00:10.171115	2014-04-01 16:00:10.171115	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	3	2	f	\N	0	0	0	0	2014-04-01 16:00:10.174206	f	\N	0	0	0	\N	\N	3	1	1
18	1	15	1	The export was successful.	<p>The export was successful.</p>	2014-04-01 14:35:34.132718	2014-04-01 14:35:34.132718	\N	0	0	\N	0	0	0	0	14	0.900000000000000022	1	1	0	1	1	f	\N	0	0	0	0	2014-04-01 14:35:34.139811	f	\N	0	0	0	\N	\N	4	1	1
21	1	17	1	The export was successful.	<p>The export was successful.</p>	2014-04-01 16:11:18.548993	2014-04-01 16:11:18.548993	\N	0	0	\N	0	0	0	0	11	0.75	1	1	0	1	1	f	\N	0	0	0	0	2014-04-01 16:11:18.55476	f	\N	0	0	0	\N	\N	4	1	1
22	1	18	1	The export was successful.	<p>The export was successful.</p>	2014-04-01 16:27:14.254441	2014-04-01 16:27:14.254441	\N	0	0	\N	0	0	0	0	\N	\N	0	1	0	1	1	f	\N	0	0	0	0	2014-04-01 16:27:14.26086	f	\N	1	0	0	\N	\N	4	1	1
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('posts_id_seq', 22, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY schema_migrations (version) FROM stdin;
20120311163914
20120311164326
20120311170118
20120311201341
20120311210245
20120416201606
20120420183447
20120423140906
20120423142820
20120423151548
20120425145456
20120427150624
20120427151452
20120427154330
20120427172031
20120502183240
20120502192121
20120503205521
20120507144132
20120507144222
20120514144549
20120514173920
20120514204934
20120517200130
20120518200115
20120519182212
20120523180723
20120523184307
20120523201329
20120525194845
20120529175956
20120529202707
20120530150726
20120530160745
20120530200724
20120530212912
20120614190726
20120614202024
20120615180517
20120618152946
20120618212349
20120618214856
20120619150807
20120619153349
20120619172714
20120621155351
20120621190310
20120622200242
20120625145714
20120625162318
20120625174544
20120625195326
20120629143908
20120629150253
20120629151243
20120629182637
20120702211427
20120703184734
20120703201312
20120703203623
20120703210004
20120704160659
20120704201743
20120705181724
20120708210305
20120712150500
20120712151934
20120713201324
20120716020835
20120716173544
20120718044955
20120719004636
20120720013733
20120720044246
20120720162422
20120723051512
20120724234502
20120724234711
20120725183347
20120726201830
20120726235129
20120727005556
20120727150428
20120727213543
20120802151210
20120803191426
20120806030641
20120806062617
20120807223020
20120809020415
20120809030647
20120809053414
20120809154750
20120809174649
20120809175110
20120809201855
20120810064839
20120812235417
20120813004347
20120813042912
20120813201426
20120815004411
20120815180106
20120815204733
20120816050526
20120816205537
20120816205538
20120820191804
20120821191616
20120823205956
20120824171908
20120828204209
20120828204624
20120830182736
20120910171504
20120918152319
20120918205931
20120919152846
20120921055428
20120921155050
20120921162512
20120921163606
20120924182000
20120924182031
20120925171620
20120925190802
20120928170023
20121009161116
20121011155904
20121017162924
20121018103721
20121018133039
20121018182709
20121106015500
20121108193516
20121109164630
20121113200844
20121113200845
20121115172544
20121116212424
20121119190529
20121119200843
20121121202035
20121121205215
20121122033316
20121123054127
20121123063630
20121129160035
20121129184948
20121130010400
20121130191818
20121202225421
20121203181719
20121204183855
20121204193747
20121205162143
20121207000741
20121211233131
20121216230719
20121218205642
20121224072204
20121224095139
20121224100650
20121228192219
20130107165207
20130108195847
20130115012140
20130115021937
20130115043603
20130116151829
20130120222728
20130121231352
20130122051134
20130122232825
20130123070909
20130125002652
20130125030305
20130125031122
20130127213646
20130128182013
20130129010625
20130129163244
20130129174845
20130130154611
20130131055710
20130201000828
20130201023409
20130203204338
20130204000159
20130205021905
20130207200019
20130208220635
20130213021450
20130213203300
20130221215017
20130226015336
20130306180148
20130311181327
20130313004922
20130314093434
20130315180637
20130319122248
20130320012100
20130320024345
20130321154905
20130322183614
20130326210101
20130327185852
20130328162943
20130328182433
20130402210723
20130404143437
20130404232558
20130411205132
20130412015502
20130412020156
20130416004607
20130416004933
20130416170855
20130419195746
20130422050626
20130424015746
20130424055025
20130426044914
20130426052257
20130428194335
20130429000101
20130430052751
20130501105651
20130506020935
20130506185042
20130508040235
20130509040248
20130509041351
20130515193551
20130521210140
20130522193615
20130527152648
20130528174147
20130531210816
20130603192412
20130606190601
20130610201033
20130612200846
20130613211700
20130613212230
20130615064344
20130615073305
20130615075557
20130616082327
20130617014127
20130617180009
20130617181804
20130619063902
20130621042855
20130622110348
20130624203206
20130625022454
20130625170842
20130625201113
20130709184941
20130710201248
20130712041133
20130712163509
20130723212758
20130724201552
20130725213613
20130728172550
20130731163035
20130801155107
20130807202516
20130809160751
20130809204732
20130809211409
20130813204212
20130813224817
20130816024250
20130819192358
20130820174431
20130822213513
20130823201420
20130826011521
20130828192526
20130903154323
20130904181208
20130906081326
20130906171631
20130910040235
20130910220317
20130911182437
20130912185218
20130913210454
20130917174738
20131001060630
20131002070347
20131003061137
20131014203951
20131015131652
20131017014509
20131017030605
20131017205954
20131018050738
20131022045114
20131022151218
20131023163509
20131105101051
20131107154900
20131114185225
20131115165105
20131118173159
20131120055018
20131122064921
20131206200009
20131209091702
20131209091742
20131210163702
20131210181901
20131210234530
20131212225511
20131216164557
20131217174004
20131219203905
20131223171005
20131227164338
20131229221725
20131230010239
20140101235747
20140102104229
20140102194802
20140107220141
20140109205940
20140116170655
20140120155706
20140121204628
20140122043508
20140124202427
20140129164541
20140206044818
20140206195001
20140206215029
20140210194146
20140211230222
20140211234523
20140214151255
20140220160510
20140220163213
20140224232712
20140224232913
20140227104930
20140227201005
20140228005443
20140228173431
20140228205743
20140303185354
20140304200606
20140304201403
20140305100909
20140306223522
20140318150412
20140318203559
20140320042653
\.


--
-- Data for Name: screened_emails; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY screened_emails (id, email, action_type, match_count, last_match_at, created_at, updated_at, ip_address) FROM stdin;
\.


--
-- Name: screened_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('screened_emails_id_seq', 1, false);


--
-- Data for Name: screened_ip_addresses; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY screened_ip_addresses (id, ip_address, action_type, match_count, last_match_at, created_at, updated_at) FROM stdin;
1	10.0.0.0/8	2	0	\N	2014-03-31 15:09:50.864934	2014-03-31 15:09:50.864934
2	192.168.0.0/16	2	0	\N	2014-03-31 15:09:50.886152	2014-03-31 15:09:50.886152
4	172.16.0.0/12	2	0	\N	2014-03-31 15:09:50.890015	2014-03-31 15:09:50.890015
5	fc00::/7	2	0	\N	2014-03-31 15:09:50.891899	2014-03-31 15:09:50.891899
3	127.0.0.0/8	2	3	2014-03-31 15:11:25.940522	2014-03-31 15:09:50.888138	2014-03-31 15:11:25.940751
\.


--
-- Name: screened_ip_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('screened_ip_addresses_id_seq', 6, true);


--
-- Data for Name: screened_urls; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY screened_urls (id, url, domain, action_type, match_count, last_match_at, created_at, updated_at, ip_address) FROM stdin;
\.


--
-- Name: screened_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('screened_urls_id_seq', 1, false);


--
-- Data for Name: single_sign_on_records; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY single_sign_on_records (id, user_id, external_id, last_payload, created_at, updated_at, external_username, external_email, external_name) FROM stdin;
1	2	1	nonce=25cf932ba52824e4e879d83f86463c8d&name=Jamie&username=jamie&email=jgaskins%40gmail.com&external_id=1	2014-03-31 15:21:08.954125	2014-03-31 15:21:08.954125	jamie	jgaskins@gmail.com	Jamie
\.


--
-- Name: single_sign_on_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('single_sign_on_records_id_seq', 1, true);


--
-- Data for Name: site_contents; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY site_contents (content_type, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: site_customizations; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY site_customizations (id, name, stylesheet, header, "position", user_id, enabled, key, created_at, updated_at, override_default_style, stylesheet_baked, mobile_stylesheet, mobile_header, mobile_stylesheet_baked) FROM stdin;
2	Ovatemp			1	2	t	70c2f5db-4132-4615-82ec-c27b404a26b9	2014-03-31 18:38:24.699092	2014-04-01 18:42:30.848766	f		#main-outlet {\n    padding-top: 60px;\n}\n\n.avatar {\n    border-radius: 50%;\n}\n\n.creator .avatar {\n    float: left;\n    margin: 4px;\n}\n\n.creator {\n    display: inline-block;\n    margin: 5%;\n    vertical-align: middle;\n    width: 60%;\n}\n\n.creator::after {\n    clear: both;\n}\n.creator .name {\n    font-family: "Helvetica Neue";\n    color: black;\n}\n\n.last-unread-link {\n    font-weight: bold;\n}\n\n.post-count {\n    display: inline-block;\n    width: 10%;\n    margin: 5%;\n    vertical-align: middle;\n    background: darkblue;\n    border-radius: 10px;\n    text-align: center;\n    height: 19px;\n    color: white;\n    padding-top: 2px;\n}		#main-outlet{padding-top:60px}.avatar{border-radius:50%}.creator .avatar{float:left;margin:4px}.creator{display:inline-block;margin:5%;vertical-align:middle;width:60%}.creator::after{clear:both}.creator .name{font-family:"Helvetica Neue";color:black}.last-unread-link{font-weight:bold}.post-count{display:inline-block;width:10%;margin:5%;vertical-align:middle;background:darkblue;border-radius:10px;text-align:center;height:19px;color:white;padding-top:2px}\n
\.


--
-- Name: site_customizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('site_customizations_id_seq', 2, true);


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY site_settings (id, name, data_type, value, created_at, updated_at) FROM stdin;
2	lounge_category_id	3	2	2014-03-31 15:09:49.236794	2014-03-31 15:09:49.236794
3	meta_category_id	3	3	2014-03-31 15:09:49.86054	2014-03-31 15:09:49.86054
4	staff_category_id	3	4	2014-03-31 15:09:50.108148	2014-03-31 15:09:50.108148
6	has_login_hint	5	f	2014-03-31 15:11:42.244673	2014-03-31 15:12:27.942765
5	global_notice	1		2014-03-31 15:11:42.228284	2014-03-31 15:12:27.944871
18	favicon_url	1	/images/ovatemp-icon.png	2014-03-31 19:46:02.040722	2014-04-01 16:16:44.590183
12	enable_private_messages	5	f	2014-03-31 15:50:26.232361	2014-03-31 15:50:26.232361
15	title	1	Ovatemp	2014-03-31 19:40:59.218946	2014-04-01 16:16:50.858668
45	apple_touch_icon_url	1	/images/ovatemp-icon.png	2014-04-01 16:17:20.592366	2014-04-01 16:17:20.592366
19	invite_only	5	t	2014-03-31 20:30:29.202649	2014-04-01 16:17:33.559685
20	login_required	5	f	2014-03-31 20:30:30.70569	2014-04-01 16:17:40.845745
28	enable_local_logins	5	f	2014-03-31 20:32:23.31216	2014-04-01 16:17:56.229537
35	min_password_length	3	4	2014-04-01 14:53:22.423243	2014-04-01 16:18:01.011558
36	block_common_passwords	5	f	2014-04-01 14:53:32.910395	2014-04-01 16:18:03.09179
22	enable_google_logins	5	f	2014-03-31 20:30:42.801729	2014-04-01 16:18:04.517761
27	use_https	5	f	2014-03-31 20:31:22.523726	2014-03-31 20:31:23.2048
23	enable_yahoo_logins	5	f	2014-03-31 20:30:45.051179	2014-04-01 16:18:05.022006
21	must_approve_users	5	f	2014-03-31 20:30:32.059195	2014-03-31 20:32:21.00797
24	enable_twitter_logins	5	f	2014-03-31 20:30:45.9156	2014-04-01 16:18:05.672799
25	enable_facebook_logins	5	f	2014-03-31 20:30:47.350351	2014-04-01 16:18:07.493906
7	enable_sso	5	t	2014-03-31 15:14:25.424061	2014-04-01 16:18:10.129897
9	sso_url	1	http://localhost:3001/api/community	2014-03-31 15:14:50.409805	2014-04-01 16:18:16.965463
8	sso_secret	1	1234	2014-03-31 15:14:49.684947	2014-04-01 16:18:19.31703
30	topics_per_period_in_top_page	3	0	2014-04-01 14:32:37.320926	2014-04-01 14:32:37.320926
31	topics_per_period_in_top_summary	3	0	2014-04-01 14:32:49.245547	2014-04-01 14:32:49.245547
32	company_full_name	1	Ovatemp	2014-04-01 14:34:01.478218	2014-04-01 14:34:01.478218
33	company_short_name	1	Ovatemp	2014-04-01 14:34:07.914355	2014-04-01 14:34:07.914355
46	sso_overrides_email	5	t	2014-04-01 16:18:21.760792	2014-04-01 16:18:21.760792
37	sso_overrides_username	5	t	2014-04-01 14:56:12.524907	2014-04-01 16:18:22.476055
38	sso_overrides_name	5	t	2014-04-01 14:56:16.116247	2014-04-01 16:18:23.320303
39	enable_mobile_theme	5	t	2014-04-01 15:08:45.194722	2014-04-01 15:16:30.748163
41	enable_noscript_support	5	f	2014-04-01 15:21:18.357629	2014-04-01 15:21:18.357629
42	allow_index_in_robots_txt	5	f	2014-04-01 15:21:21.575906	2014-04-01 15:21:21.575906
43	enable_escaped_fragments	5	f	2014-04-01 15:21:31.052698	2014-04-01 15:21:31.052698
47	enforce_global_nicknames	5	f	2014-04-01 16:18:25.416722	2014-04-01 16:18:27.260913
44	uncategorized_category_id	3	9	2014-04-01 16:14:11.873167	2014-04-01 16:14:11.873167
11	post_menu	1	like|edit|flag|delete|reply	2014-03-31 15:48:38.293499	2014-04-01 16:15:45.203506
10	top_menu	1	latest|new|unread|starred|top	2014-03-31 15:48:26.636567	2014-04-01 16:15:49.594716
40	share_links	1		2014-04-01 15:18:17.026724	2014-04-01 16:15:53.449613
29	category_featured_topics	3	0	2014-04-01 14:32:22.061513	2014-04-01 16:16:00.78437
16	logo_url	1	/images/ovatemp-icon.png	2014-03-31 19:44:00.564137	2014-04-01 16:16:37.109832
17	logo_small_url	1	/images/ovatemp-icon.png	2014-03-31 19:44:12.827229	2014-04-01 16:16:41.787814
26	email_editable	5	f	2014-03-31 20:30:53.792078	2014-04-01 16:18:40.059245
48	redirect_users_to_top_page	5	f	2014-04-01 16:18:44.70083	2014-04-01 16:18:44.70083
49	min_post_length	3	10	2014-04-01 16:18:53.34111	2014-04-01 16:18:53.34111
50	allow_duplicate_topic_titles	5	f	2014-04-01 16:19:22.755657	2014-04-01 16:19:26.477049
51	send_welcome_message	5	f	2014-04-01 16:21:03.50161	2014-04-01 16:21:03.50161
52	new_version_emails	5	f	2014-04-01 16:21:09.090293	2014-04-01 16:21:09.090293
13	suppress_uncategorized_badge	5	f	2014-03-31 16:33:47.426415	2014-04-01 16:21:10.658825
14	allow_uncategorized_topics	5	f	2014-03-31 16:33:58.613181	2014-04-01 16:21:44.89604
34	suggested_topics	3	0	2014-04-01 14:51:35.875026	2014-04-01 17:57:43.027712
\.


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('site_settings_id_seq', 52, true);


--
-- Data for Name: top_topics; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY top_topics (id, topic_id, yearly_posts_count, yearly_views_count, yearly_likes_count, monthly_posts_count, monthly_views_count, monthly_likes_count, weekly_posts_count, weekly_views_count, weekly_likes_count, daily_posts_count, daily_views_count, daily_likes_count, yearly_score, monthly_score, weekly_score, daily_score) FROM stdin;
6	6	1	1	1	1	1	1	1	1	1	0	1	0	\N	\N	\N	\N
3	4	0	1	1	0	1	1	0	1	1	0	1	0	\N	\N	\N	\N
5	5	0	1	1	0	1	1	0	1	1	0	1	0	\N	\N	\N	\N
4	9	1	1	1	1	1	1	1	1	1	0	1	0	\N	\N	\N	\N
2	14	1	1	1	1	1	1	1	1	1	1	1	1	\N	\N	\N	\N
1	16	1	1	1	1	1	1	1	1	1	1	1	1	\N	\N	\N	\N
\.


--
-- Name: top_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('top_topics_id_seq', 6, true);


--
-- Data for Name: topic_allowed_groups; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topic_allowed_groups (id, group_id, topic_id) FROM stdin;
\.


--
-- Name: topic_allowed_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topic_allowed_groups_id_seq', 1, false);


--
-- Data for Name: topic_allowed_users; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topic_allowed_users (id, user_id, topic_id, created_at, updated_at) FROM stdin;
1	2	15	2014-04-01 14:35:34.028443	2014-04-01 14:35:34.028443
2	1	15	2014-04-01 14:35:34.033909	2014-04-01 14:35:34.033909
3	2	17	2014-04-01 16:11:18.384456	2014-04-01 16:11:18.384456
4	1	17	2014-04-01 16:11:18.389958	2014-04-01 16:11:18.389958
5	2	18	2014-04-01 16:27:13.931749	2014-04-01 16:27:13.931749
6	1	18	2014-04-01 16:27:13.936682	2014-04-01 16:27:13.936682
\.


--
-- Name: topic_allowed_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topic_allowed_users_id_seq', 6, true);


--
-- Data for Name: topic_embeds; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topic_embeds (id, topic_id, post_id, embed_url, content_sha1, created_at, updated_at) FROM stdin;
\.


--
-- Name: topic_embeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topic_embeds_id_seq', 1, false);


--
-- Data for Name: topic_invites; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topic_invites (id, topic_id, invite_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: topic_invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topic_invites_id_seq', 1, false);


--
-- Data for Name: topic_link_clicks; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topic_link_clicks (id, topic_link_id, user_id, created_at, updated_at, ip_address) FROM stdin;
\.


--
-- Name: topic_link_clicks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topic_link_clicks_id_seq', 1, false);


--
-- Data for Name: topic_links; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topic_links (id, topic_id, post_id, user_id, url, domain, internal, link_topic_id, created_at, updated_at, reflection, clicks, link_post_id) FROM stdin;
1	4	4	-1	http://www.discourse.org	www.discourse.org	f	\N	2014-03-31 15:09:52.441123	2014-03-31 15:09:52.441123	f	0	\N
2	4	4	-1	/t/assets-for-the-forum-design/5	localhost	t	5	2014-03-31 15:09:52.581849	2014-03-31 15:09:52.581849	f	0	\N
3	4	4	-1	https://meta.discourse.org/t/configuring-twitter-login-for-discourse/13395	meta.discourse.org	f	\N	2014-03-31 15:09:52.584857	2014-03-31 15:09:52.584857	f	0	\N
4	4	4	-1	https://meta.discourse.org/t/configuring-facebook-login-for-discourse/13394	meta.discourse.org	f	\N	2014-03-31 15:09:52.586504	2014-03-31 15:09:52.586504	f	0	\N
5	4	4	-1	https://meta.discourse.org/t/configuring-github-login-for-discourse/13745	meta.discourse.org	f	\N	2014-03-31 15:09:52.588073	2014-03-31 15:09:52.588073	f	0	\N
6	4	4	-1	/category/meta	localhost	t	\N	2014-03-31 15:09:52.597467	2014-03-31 15:09:52.597467	f	0	\N
7	4	4	-1	https://meta.discourse.org/t/what-is-meta/5249	meta.discourse.org	f	\N	2014-03-31 15:09:52.599449	2014-03-31 15:09:52.599449	f	0	\N
8	4	4	-1	/category/lounge	localhost	t	\N	2014-03-31 15:09:52.602358	2014-03-31 15:09:52.602358	f	0	\N
9	4	4	-1	/category/staff	localhost	t	\N	2014-03-31 15:09:52.60513	2014-03-31 15:09:52.60513	f	0	\N
10	4	4	-1	/categories	localhost	t	\N	2014-03-31 15:09:52.617124	2014-03-31 15:09:52.617124	f	0	\N
11	4	4	-1	http://meta.discourse.org/t/how-to-set-up-image-uploads-to-s3/7229	meta.discourse.org	f	\N	2014-03-31 15:09:52.619157	2014-03-31 15:09:52.619157	f	0	\N
12	4	4	-1	http://meta.discourse.org/t/new-attachments/8609	meta.discourse.org	f	\N	2014-03-31 15:09:52.620808	2014-03-31 15:09:52.620808	f	0	\N
13	4	4	-1	http://mandrill.com	mandrill.com	f	\N	2014-03-31 15:09:52.623186	2014-03-31 15:09:52.623186	f	0	\N
14	4	4	-1	http://www.mailgun.com/	www.mailgun.com	f	\N	2014-03-31 15:09:52.624887	2014-03-31 15:09:52.624887	f	0	\N
15	4	4	-1	http://www.mailjet.com/	www.mailjet.com	f	\N	2014-03-31 15:09:52.626922	2014-03-31 15:09:52.626922	f	0	\N
16	4	4	-1	/t/welcome-to-discourse	localhost	t	\N	2014-03-31 15:09:52.629895	2014-03-31 15:09:52.629895	f	0	\N
17	4	4	-1	/tos	localhost	t	\N	2014-03-31 15:09:52.638287	2014-03-31 15:09:52.638287	f	0	\N
18	4	4	-1	/tos#3	localhost	t	\N	2014-03-31 15:09:52.642231	2014-03-31 15:09:52.642231	f	0	\N
19	4	4	-1	https://github.com/discourse/discourse/blob/master/docs/INSTALL.md	github.com	f	\N	2014-03-31 15:09:52.643814	2014-03-31 15:09:52.643814	f	0	\N
20	4	4	-1	https://github.com/discourse/discourse/blob/master/docs/ADMIN-QUICK-START-GUIDE.md	github.com	f	\N	2014-03-31 15:09:52.645724	2014-03-31 15:09:52.645724	f	0	\N
21	4	4	-1	http://meta.discourse.org/category/support	meta.discourse.org	f	\N	2014-03-31 15:09:52.647259	2014-03-31 15:09:52.647259	f	0	\N
22	4	4	-1	http://meta.discourse.org/category/hosting	meta.discourse.org	f	\N	2014-03-31 15:09:52.648754	2014-03-31 15:09:52.648754	f	0	\N
23	4	4	-1	http://meta.discourse.org	meta.discourse.org	f	\N	2014-03-31 15:09:52.650255	2014-03-31 15:09:52.650255	f	0	\N
\.


--
-- Name: topic_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topic_links_id_seq', 23, true);


--
-- Data for Name: topic_users; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topic_users (user_id, topic_id, starred, posted, last_read_post_number, seen_post_count, starred_at, last_visited_at, first_visited_at, notification_level, notifications_changed_at, notifications_reason_id, total_msecs_viewed, cleared_pinned_at, unstarred_at, id, last_emailed_post_number) FROM stdin;
-1	1	f	t	1	1	\N	2014-03-31 15:09:51.476084	2014-03-31 15:09:51.476084	3	2014-03-31 15:09:51.474346	1	0	\N	\N	1	\N
-1	2	f	t	1	1	\N	2014-03-31 15:09:51.814077	2014-03-31 15:09:51.814077	3	2014-03-31 15:09:51.813512	1	0	\N	\N	2	\N
-1	3	f	t	1	1	\N	2014-03-31 15:09:51.899908	2014-03-31 15:09:51.899908	3	2014-03-31 15:09:51.899355	1	0	\N	\N	3	\N
-1	4	f	t	1	1	\N	2014-03-31 15:09:52.291604	2014-03-31 15:09:52.291604	3	2014-03-31 15:09:52.291005	1	0	\N	\N	4	\N
-1	5	f	t	1	1	\N	2014-03-31 15:09:52.83994	2014-03-31 15:09:52.83994	3	2014-03-31 15:09:52.839305	1	0	\N	\N	5	\N
-1	6	f	t	1	1	\N	2014-03-31 15:09:52.895239	2014-03-31 15:09:52.895239	3	2014-03-31 15:09:52.894735	1	0	\N	\N	6	\N
1	15	f	t	1	1	\N	2014-04-01 14:35:34.097394	2014-04-01 14:35:34.097394	3	2014-04-01 14:35:34.095303	1	0	\N	\N	19	\N
2	15	f	f	1	1	\N	2014-04-01 14:35:34.108771	2014-04-01 14:35:34.108771	3	2014-04-01 14:35:34.106998	2	14023	\N	\N	20	\N
9	9	f	f	\N	\N	\N	2014-04-01 16:26:48.86663	2014-04-01 16:13:29.447655	1	\N	\N	0	\N	\N	25	\N
15	15	f	f	\N	\N	\N	2014-04-01 16:13:30.61874	2014-04-01 16:13:30.61874	1	\N	\N	0	\N	\N	38	\N
6	6	f	f	\N	\N	\N	2014-04-01 16:13:29.323942	2014-04-01 16:13:27.873233	1	\N	\N	0	\N	\N	24	\N
1	1	f	f	\N	\N	\N	2014-04-01 16:26:48.88052	2014-04-01 16:13:29.081033	1	\N	\N	0	\N	\N	28	\N
2	6	f	t	2	2	\N	2014-03-31 15:44:40.788092	2014-03-31 15:44:40.788092	2	2014-03-31 15:44:58.423853	4	193867	\N	\N	7	\N
2	11	f	t	1	2	\N	2014-03-31 16:37:57.760318	2014-03-31 16:37:57.760318	1	\N	\N	4009	\N	\N	14	\N
2	5	f	f	1	1	\N	2014-03-31 15:52:57.784498	2014-03-31 15:52:57.784498	1	\N	\N	17428	\N	\N	12	\N
2	1	f	f	1	1	\N	2014-03-31 15:50:56.585362	2014-03-31 15:50:56.585362	1	\N	\N	25351	\N	\N	11	\N
11	11	f	f	\N	\N	\N	2014-04-01 16:13:29.770274	2014-04-01 16:13:29.770274	1	\N	\N	0	\N	\N	33	\N
13	13	f	f	\N	\N	\N	2014-04-01 16:13:29.895483	2014-04-01 16:13:29.895483	1	\N	\N	0	\N	\N	35	\N
2	14	f	t	1	1	2014-03-31 20:30:08.392679	2014-03-31 19:23:07.379845	2014-03-31 19:23:07.379845	3	2014-03-31 20:32:44.41735	2	795965	\N	2014-03-31 20:30:09.472086	17	\N
2	13	f	t	1	2	\N	2014-03-31 16:40:48.172008	2014-03-31 16:40:48.172008	1	\N	\N	4005	\N	\N	16	\N
2	18	f	f	\N	\N	\N	2014-04-01 16:27:14.107452	2014-04-01 16:27:14.107452	3	2014-04-01 16:27:14.106005	2	0	\N	\N	42	\N
1	18	f	t	1	1	\N	2014-04-01 16:27:14.097276	2014-04-01 16:27:14.097276	3	2014-04-01 16:27:14.095116	1	0	\N	\N	41	\N
10	10	f	f	\N	\N	\N	2014-04-01 18:42:36.358844	2014-04-01 16:13:29.663475	1	\N	\N	0	\N	\N	32	\N
2	9	f	t	1	1	\N	2014-03-31 15:50:05.312701	2014-03-31 15:50:05.312701	3	2014-03-31 15:50:05.31215	1	31542	\N	\N	10	\N
16	16	f	f	\N	\N	\N	2014-04-01 17:58:05.370546	2014-04-01 16:13:30.922403	1	\N	\N	0	\N	\N	39	\N
2	16	f	t	1	1	\N	2014-04-01 15:59:54.917805	2014-04-01 15:59:54.917805	3	2014-04-01 15:59:54.917075	1	6509	\N	\N	21	\N
5	5	f	f	\N	\N	\N	2014-04-01 16:13:30.611354	2014-04-01 16:13:29.55497	1	\N	\N	0	\N	\N	31	\N
2	10	f	t	3	3	\N	2014-03-31 16:36:34.111407	2014-03-31 16:36:34.111407	2	2014-03-31 16:36:54.287691	4	940516	2014-04-01 15:59:26.521311	\N	13	\N
1	17	f	t	1	1	\N	2014-04-01 16:11:18.519151	2014-04-01 16:11:18.519151	3	2014-04-01 16:11:18.517329	1	0	\N	\N	22	\N
2	17	f	f	1	1	\N	2014-04-01 16:11:18.52882	2014-04-01 16:11:18.52882	3	2014-04-01 16:11:18.527111	2	10949	\N	\N	23	\N
2	4	f	f	1	1	\N	2014-04-01 14:31:35.713172	2014-04-01 14:31:35.713172	1	\N	\N	2097	\N	\N	18	\N
14	14	f	f	\N	\N	\N	2014-04-01 16:13:30.723305	2014-04-01 16:13:29.776873	1	\N	\N	0	\N	\N	36	\N
17	17	f	f	\N	\N	\N	2014-04-01 16:13:31.060111	2014-04-01 16:13:31.060111	1	\N	\N	0	\N	\N	40	\N
12	12	f	f	\N	\N	\N	2014-04-01 18:29:24.518067	2014-04-01 16:13:29.796695	1	\N	\N	0	\N	\N	34	\N
2	12	f	t	2	2	\N	2014-03-31 16:38:54.028484	2014-03-31 16:38:54.028484	3	2014-04-01 18:28:10.762198	2	72251	\N	\N	15	\N
4	4	f	f	\N	\N	\N	2014-04-01 16:13:30.441671	2014-04-01 16:13:30.441671	1	\N	\N	0	\N	\N	37	\N
\.


--
-- Name: topic_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topic_users_id_seq', 42, true);


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY topics (id, title, last_posted_at, created_at, updated_at, views, posts_count, user_id, last_post_user_id, reply_count, featured_user1_id, featured_user2_id, featured_user3_id, avg_time, deleted_at, highest_post_number, image_url, off_topic_count, like_count, incoming_link_count, bookmark_count, star_count, category_id, visible, moderator_posts_count, closed, archived, bumped_at, has_summary, meta_data, vote_count, archetype, featured_user4_id, notify_moderators_count, spam_count, illegal_count, inappropriate_count, pinned_at, score, percent_rank, notify_user_count, subtype, slug, auto_close_at, auto_close_user_id, auto_close_started_at, deleted_by_id, participant_count, word_count, excerpt) FROM stdin;
11	About the Trying to Avoid category	2014-03-31 16:37:57.728195	2014-03-31 16:37:40.038272	2014-03-31 16:37:57.790124	1	2	2	2	0	\N	\N	\N	\N	\N	2	\N	0	0	0	0	0	6	f	1	f	f	2014-03-31 16:37:40.038405	f	\N	0	regular	\N	0	0	0	0	2014-03-31 16:37:40.03521	0.100000000000000006	0.818181818181818232	0	\N	about-the-trying-to-avoid-category	\N	\N	\N	\N	1	26	\N
10	About the Trying to Conceive category	2014-04-01 16:00:10.171115	2014-03-31 16:36:15.185765	2014-04-01 16:00:10.193638	1	3	2	2	0	\N	\N	\N	\N	\N	3	\N	0	0	0	0	0	5	f	1	f	f	2014-04-01 16:00:10.171115	f	\N	0	regular	\N	0	0	0	0	2014-03-31 16:36:15.182101	0.200000000000000039	0.333333333333333315	0	\N	about-the-trying-to-conceive-category	\N	\N	\N	\N	1	29	\N
14	Conception is a thing that happens	2014-03-31 19:23:07.523647	2014-03-31 19:23:07.329207	2014-03-31 19:23:07.537654	1	1	2	2	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	0	5	t	0	f	f	2014-03-31 19:23:07.523647	f	\N	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.44444444444444442	0	\N	conception-is-a-thing-that-happens	\N	\N	\N	\N	1	21	asdjfhagsdjfhgajhkf ahjksdg fjkhasgd fjkhasgd fjkahsgd fkjhasg fkjhasg fkjhasgd fkahjsg fkjhasg dfkjahsg fkjahsg fkjhasd gfkjahsgd fkjhasgd fjkahsgd fjahksg dfjkhasg fjkhasg dfhjkas gdf
16	Asdfhjaklsdfhajkl sdfhas lkdjfh	2014-04-01 15:59:55.048992	2014-04-01 15:59:54.866845	2014-04-01 15:59:55.081643	1	1	2	2	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	0	5	t	0	f	f	2014-04-01 15:59:55.048992	f	\N	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.44444444444444442	0	\N	asdfhjaklsdfhajkl-sdfhas-lkdjfh	\N	\N	\N	\N	1	4	askdjhfaksjdhfaklsjdfhaakjshfajkl sdhfjklasdhf kljashdf kljashdf
4	Discourse Admin Quick Start Guide	2014-03-31 15:09:52.315443	2014-03-31 15:09:52.266173	2014-03-31 15:09:52.716274	1	1	-1	-1	0	\N	\N	\N	5	\N	1	/plugins/emoji/images/hatching_chick.png	0	0	0	0	0	4	t	0	f	f	2014-03-31 15:09:52.315443	f	\N	0	regular	\N	0	0	0	0	\N	0.450000000000000011	0.363636363636363646	0	\N	discourse-admin-quick-start-guide	\N	\N	\N	\N	1	1499	Congratulations, you are now the proud owner of your very own Civilized Discourse Construction Kit. [hatching_chick] \n\nLet&#39;s get started! \n\nAdmin Dashboard\n\nTo access the admin dashboard, click here: \n\n/admin \n\nYou can a&hellip;
12	About the Share the Good News category	2014-03-31 16:38:53.988872	2014-03-31 16:38:40.034389	2014-03-31 16:38:54.145352	1	2	2	2	0	\N	\N	\N	\N	\N	2	\N	0	0	0	0	0	7	f	1	f	f	2014-03-31 16:38:40.034517	f	\N	0	regular	\N	0	0	0	0	2014-03-31 16:38:40.030955	0.100000000000000006	0.818181818181818232	0	\N	about-the-share-the-good-news-category	\N	\N	\N	\N	1	26	\N
13	About the Fertility Questions category	2014-03-31 16:40:48.154755	2014-03-31 16:40:36.482547	2014-03-31 16:40:48.19577	1	2	2	2	0	\N	\N	\N	\N	\N	2	\N	0	0	0	0	0	8	f	1	f	f	2014-03-31 16:40:36.482662	f	\N	0	regular	\N	0	0	0	0	2014-03-31 16:40:36.479573	0.100000000000000006	0.818181818181818232	0	\N	about-the-fertility-questions-category	\N	\N	\N	\N	1	26	\N
9	I am a topic and people like me	2014-03-31 15:50:05.322876	2014-03-31 15:50:05.293843	2014-03-31 15:50:05.335611	1	1	2	2	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	0	2	t	0	f	f	2014-03-31 15:50:05.322876	f	\N	0	regular	\N	0	0	0	1	\N	0.200000000000000011	0.545454545454545414	0	\N	i-am-a-topic-and-people-like-me	\N	\N	\N	\N	1	22	NO ONE ACTUALLY LIKE ME \n\nFUCK OFF DISCOURSE \n\nIn all seriousness, this is a little bit of a ridiculous requiremtwr tg smkdadfshmlkf
5	Assets for the forum design	2014-03-31 15:09:52.844824	2014-03-31 15:09:52.819647	2014-03-31 15:09:52.85775	1	1	-1	-1	0	\N	\N	\N	20	\N	1	\N	0	0	0	0	0	4	t	0	f	f	2014-03-31 15:09:52.844824	f	\N	0	regular	\N	0	0	0	0	\N	1.19999999999999996	0.0909090909090909116	0	\N	assets-for-the-forum-design	\N	\N	\N	\N	1	17	This is a topic to store forum assets used in the forum design. Don&#39;t delete it!
6	Welcome to Discourse	2014-03-31 15:44:58.389659	2014-03-31 15:09:52.878618	2014-04-01 16:13:29.199624	1	2	-1	2	0	\N	\N	\N	179	\N	2	\N	0	0	0	0	0	1	t	0	f	f	2014-03-31 15:44:58.389659	f	\N	0	regular	\N	0	0	0	0	2014-03-31 15:09:52.932186	4.67499999999999982	0	0	\N	welcome-to-discourse	\N	\N	\N	\N	2	89	The first paragraph of this pinned topic will be visible as an intro message to new users on the homepage. It&#39;s important! \n\nEdit this into a brief description of your forum: \n\nWho is it for?What can they find here?Why s&hellip;
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('topics_id_seq', 18, true);


--
-- Data for Name: twitter_user_infos; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY twitter_user_infos (id, user_id, screen_name, twitter_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: twitter_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('twitter_user_infos_id_seq', 1, false);


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY uploads (id, user_id, original_filename, filesize, width, height, url, created_at, updated_at, sha1, origin) FROM stdin;
\.


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('uploads_id_seq', 1, false);


--
-- Data for Name: user_actions; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY user_actions (id, action_type, user_id, target_topic_id, target_post_id, target_user_id, acting_user_id, created_at, updated_at) FROM stdin;
1	4	-1	1	-1	\N	-1	2014-03-31 15:09:51.305167	2014-03-31 15:09:51.436747
2	4	-1	2	-1	\N	-1	2014-03-31 15:09:51.794737	2014-03-31 15:09:51.807027
3	4	-1	3	-1	\N	-1	2014-03-31 15:09:51.882741	2014-03-31 15:09:51.893359
4	4	-1	4	-1	\N	-1	2014-03-31 15:09:52.266173	2014-03-31 15:09:52.283726
5	4	-1	5	-1	\N	-1	2014-03-31 15:09:52.819647	2014-03-31 15:09:52.832979
6	4	-1	6	-1	\N	-1	2014-03-31 15:09:52.878618	2014-03-31 15:09:52.889773
7	5	2	6	7	\N	2	2014-03-31 15:44:58.389659	2014-03-31 15:44:58.403363
11	4	2	9	-1	\N	2	2014-03-31 15:50:05.293843	2014-03-31 15:50:05.305655
12	4	2	10	-1	\N	2	2014-03-31 16:36:15.185765	2014-03-31 16:36:15.189993
13	5	2	10	10	\N	2	2014-03-31 16:36:54.26937	2014-03-31 16:36:54.277558
14	4	2	11	-1	\N	2	2014-03-31 16:37:40.038272	2014-03-31 16:37:40.042362
15	5	2	11	12	\N	2	2014-03-31 16:37:57.728195	2014-03-31 16:37:57.739522
16	4	2	12	-1	\N	2	2014-03-31 16:38:40.034389	2014-03-31 16:38:40.03832
17	5	2	12	14	\N	2	2014-03-31 16:38:53.988872	2014-03-31 16:38:54.002547
18	4	2	13	-1	\N	2	2014-03-31 16:40:36.482547	2014-03-31 16:40:36.486328
19	5	2	13	16	\N	2	2014-03-31 16:40:48.154755	2014-03-31 16:40:48.162274
20	4	2	14	-1	\N	2	2014-03-31 19:23:07.329207	2014-03-31 19:23:07.366452
23	12	1	15	-1	\N	1	2014-04-01 14:35:34.008811	2014-04-01 14:35:34.064959
24	13	2	15	-1	\N	1	2014-04-01 14:35:34.008811	2014-04-01 14:35:34.082174
25	4	2	16	-1	\N	2	2014-04-01 15:59:54.866845	2014-04-01 15:59:54.906176
26	5	2	10	20	\N	2	2014-04-01 16:00:10.171115	2014-04-01 16:00:10.177943
27	12	1	17	-1	\N	1	2014-04-01 16:11:18.373253	2014-04-01 16:11:18.412984
28	13	2	17	-1	\N	1	2014-04-01 16:11:18.373253	2014-04-01 16:11:18.506185
29	12	1	18	-1	\N	1	2014-04-01 16:27:13.922742	2014-04-01 16:27:13.984721
30	13	2	18	-1	\N	1	2014-04-01 16:27:13.922742	2014-04-01 16:27:14.081656
\.


--
-- Name: user_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('user_actions_id_seq', 30, true);


--
-- Data for Name: user_badges; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY user_badges (id, badge_id, user_id, granted_at, granted_by_id) FROM stdin;
\.


--
-- Name: user_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('user_badges_id_seq', 1, false);


--
-- Data for Name: user_histories; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY user_histories (id, action, acting_user_id, target_user_id, details, created_at, updated_at, context, ip_address, email, subject, previous_value, new_value, topic_id, admin_only) FROM stdin;
1	3	1	\N	\N	2014-03-31 15:14:25.385639	2014-03-31 15:14:25.385639	\N	\N	\N	enable_sso	f	true	\N	t
2	3	1	\N	\N	2014-03-31 15:14:49.601017	2014-03-31 15:14:49.601017	\N	\N	\N	sso_secret		asdfasdf	\N	t
3	3	1	\N	\N	2014-03-31 15:14:50.399981	2014-03-31 15:14:50.399981	\N	\N	\N	sso_url		http://localhost:3000/api/community	\N	t
4	3	1	\N	\N	2014-03-31 15:20:14.690629	2014-03-31 15:20:14.690629	\N	\N	\N	sso_secret	asdfasdf	1234	\N	t
5	3	2	\N	\N	2014-03-31 15:48:26.62644	2014-03-31 15:48:26.62644	\N	\N	\N	top_menu	latest|new|unread|starred|top|categories	categories	\N	t
6	3	2	\N	\N	2014-03-31 15:48:38.281807	2014-03-31 15:48:38.281807	\N	\N	\N	post_menu	like|edit|flag|delete|share|bookmark|reply	edit|flag|delete|bookmark|reply	\N	t
7	3	2	\N	\N	2014-03-31 15:50:26.226572	2014-03-31 15:50:26.226572	\N	\N	\N	enable_private_messages	t	false	\N	t
8	3	2	\N	\N	2014-03-31 16:16:13.868952	2014-03-31 16:16:13.868952	\N	\N	\N	top_menu	categories		\N	t
9	3	2	\N	\N	2014-03-31 16:27:33.670436	2014-03-31 16:27:33.670436	\N	\N	\N	top_menu		categories	\N	t
10	3	2	\N	\N	2014-03-31 16:27:43.456129	2014-03-31 16:27:43.456129	\N	\N	\N	top_menu	categories		\N	t
11	3	2	\N	\N	2014-03-31 16:33:47.419892	2014-03-31 16:33:47.419892	\N	\N	\N	suppress_uncategorized_badge	t	false	\N	t
12	3	2	\N	\N	2014-03-31 16:33:58.607014	2014-03-31 16:33:58.607014	\N	\N	\N	allow_uncategorized_topics	t	false	\N	t
13	4	2	\N	\N	2014-03-31 16:47:10.678949	2014-03-31 16:47:10.678949	\N	\N	\N	New Style	\N	{}	\N	f
14	4	2	\N	\N	2014-03-31 16:47:15.61796	2014-03-31 16:47:15.61796	\N	\N	\N	New Style	{"stylesheet":null,"header":null,"position":1,"enabled":false,"key":"eae7c073-af1f-4a41-87ee-45c2d9b20605","override_default_style":false}	{"enabled":"true"}	\N	f
15	5	2	\N	\N	2014-03-31 16:47:37.669138	2014-03-31 16:47:37.669138	\N	\N	\N	New Style	{"stylesheet":null,"header":null,"position":1,"enabled":true,"key":"eae7c073-af1f-4a41-87ee-45c2d9b20605","override_default_style":false}	\N	\N	f
16	4	2	\N	\N	2014-03-31 18:38:24.730421	2014-03-31 18:38:24.730421	\N	\N	\N	New Style	\N	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}"}	\N	f
17	4	2	\N	\N	2014-03-31 18:41:18.86665	2014-03-31 18:41:18.86665	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":false,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true"}	\N	f
18	4	2	\N	\N	2014-03-31 18:41:22.191364	2014-03-31 18:41:22.191364	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"true"}	\N	f
19	4	2	\N	\N	2014-03-31 18:44:27.126205	2014-03-31 18:44:27.126205	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":true}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
20	4	2	\N	\N	2014-03-31 18:46:35.437284	2014-03-31 18:46:35.437284	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
21	4	2	\N	\N	2014-03-31 18:46:50.007449	2014-03-31 18:46:50.007449	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
22	4	2	\N	\N	2014-03-31 18:57:55.70124	2014-03-31 18:57:55.70124	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
23	4	2	\N	\N	2014-03-31 18:58:34.198142	2014-03-31 18:58:34.198142	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
24	4	2	\N	\N	2014-03-31 18:59:58.011733	2014-03-31 18:59:58.011733	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"true"}	\N	f
25	4	2	\N	\N	2014-03-31 19:00:32.94189	2014-03-31 19:00:32.94189	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":true}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
26	4	2	\N	\N	2014-03-31 19:06:53.338851	2014-03-31 19:06:53.338851	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
27	4	2	\N	\N	2014-03-31 19:07:42.859002	2014-03-31 19:07:42.859002	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
28	4	2	\N	\N	2014-03-31 19:08:57.962699	2014-03-31 19:08:57.962699	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
29	4	2	\N	\N	2014-03-31 19:09:23.535333	2014-03-31 19:09:23.535333	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
30	4	2	\N	\N	2014-03-31 19:09:34.761931	2014-03-31 19:09:34.761931	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
31	4	2	\N	\N	2014-03-31 19:10:07.308732	2014-03-31 19:10:07.308732	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
32	4	2	\N	\N	2014-03-31 19:10:52.292006	2014-03-31 19:10:52.292006	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
33	4	2	\N	\N	2014-03-31 19:12:03.050442	2014-03-31 19:12:03.050442	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
34	4	2	\N	\N	2014-03-31 19:13:51.441785	2014-03-31 19:13:51.441785	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
36	4	2	\N	\N	2014-03-31 19:20:34.855117	2014-03-31 19:20:34.855117	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
39	4	2	\N	\N	2014-03-31 19:37:22.088	2014-03-31 19:37:22.088	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
40	3	2	\N	\N	2014-03-31 19:40:59.20279	2014-03-31 19:40:59.20279	\N	\N	\N	title	Discourse	Ovatemp	\N	t
42	3	2	\N	\N	2014-03-31 19:44:12.820637	2014-03-31 19:44:12.820637	\N	\N	\N	logo_small_url	/images/d-logo-sketch-small.png	/images/ovatemp-icon.png	\N	t
45	3	2	\N	\N	2014-03-31 20:30:29.984749	2014-03-31 20:30:29.984749	\N	\N	\N	invite_only	t	false	\N	t
47	3	2	\N	\N	2014-03-31 20:30:32.053097	2014-03-31 20:30:32.053097	\N	\N	\N	must_approve_users	f	true	\N	t
49	3	2	\N	\N	2014-03-31 20:30:34.138744	2014-03-31 20:30:34.138744	\N	\N	\N	invite_only	t	false	\N	t
51	3	2	\N	\N	2014-03-31 20:30:38.919857	2014-03-31 20:30:38.919857	\N	\N	\N	invite_only	t	false	\N	t
53	3	2	\N	\N	2014-03-31 20:30:45.039812	2014-03-31 20:30:45.039812	\N	\N	\N	enable_yahoo_logins	t	false	\N	t
55	3	2	\N	\N	2014-03-31 20:30:47.344578	2014-03-31 20:30:47.344578	\N	\N	\N	enable_facebook_logins	t	false	\N	t
57	3	2	\N	\N	2014-03-31 20:30:59.879095	2014-03-31 20:30:59.879095	\N	\N	\N	enable_sso	f	true	\N	t
35	4	2	\N	\N	2014-03-31 19:19:11.840886	2014-03-31 19:19:11.840886	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
37	4	2	\N	\N	2014-03-31 19:22:22.419301	2014-03-31 19:22:22.419301	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
38	4	2	\N	\N	2014-03-31 19:37:03.017831	2014-03-31 19:37:03.017831	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
41	3	2	\N	\N	2014-03-31 19:44:00.550167	2014-03-31 19:44:00.550167	\N	\N	\N	logo_url	/images/d-logo-sketch.png	/images/ovatemp-icon.png	\N	t
43	3	2	\N	\N	2014-03-31 19:46:02.030176	2014-03-31 19:46:02.030176	\N	\N	\N	favicon_url	/images/default-favicon.ico	/images/ovatemp-icon.png	\N	t
44	3	2	\N	\N	2014-03-31 20:30:29.196605	2014-03-31 20:30:29.196605	\N	\N	\N	invite_only	f	true	\N	t
46	3	2	\N	\N	2014-03-31 20:30:30.695685	2014-03-31 20:30:30.695685	\N	\N	\N	login_required	f	true	\N	t
48	3	2	\N	\N	2014-03-31 20:30:33.606028	2014-03-31 20:30:33.606028	\N	\N	\N	invite_only	f	true	\N	t
50	3	2	\N	\N	2014-03-31 20:30:34.633371	2014-03-31 20:30:34.633371	\N	\N	\N	invite_only	f	true	\N	t
52	3	2	\N	\N	2014-03-31 20:30:42.791797	2014-03-31 20:30:42.791797	\N	\N	\N	enable_google_logins	t	false	\N	t
54	3	2	\N	\N	2014-03-31 20:30:45.905529	2014-03-31 20:30:45.905529	\N	\N	\N	enable_twitter_logins	t	false	\N	t
56	3	2	\N	\N	2014-03-31 20:30:53.691533	2014-03-31 20:30:53.691533	\N	\N	\N	email_editable	t	false	\N	t
58	3	2	\N	\N	2014-03-31 20:31:22.512319	2014-03-31 20:31:22.512319	\N	\N	\N	use_https	f	true	\N	t
59	3	2	\N	\N	2014-03-31 20:31:23.198948	2014-03-31 20:31:23.198948	\N	\N	\N	use_https	t	false	\N	t
60	3	2	\N	\N	2014-03-31 20:32:16.826286	2014-03-31 20:32:16.826286	\N	\N	\N	login_required	t	true	\N	t
61	3	2	\N	\N	2014-03-31 20:32:19.58211	2014-03-31 20:32:19.58211	\N	\N	\N	must_approve_users	t	true	\N	t
62	3	2	\N	\N	2014-03-31 20:32:21.00195	2014-03-31 20:32:21.00195	\N	\N	\N	must_approve_users	t	false	\N	t
63	3	2	\N	\N	2014-03-31 20:32:23.306397	2014-03-31 20:32:23.306397	\N	\N	\N	enable_local_logins	t	false	\N	t
64	4	2	\N	\N	2014-04-01 13:24:12.004181	2014-04-01 13:24:12.004181	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
65	4	2	\N	\N	2014-04-01 13:24:54.817416	2014-04-01 13:24:54.817416	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","enabled":"true","override_default_style":"false"}	\N	f
66	3	2	\N	\N	2014-04-01 13:41:59.333479	2014-04-01 13:41:59.333479	\N	\N	\N	top_menu	latest|new|unread|starred|top|categories	latest|new|unread|categories	\N	t
67	3	2	\N	\N	2014-04-01 13:57:21.128108	2014-04-01 13:57:21.128108	\N	\N	\N	logo_url	/images/d-logo-sketch.png	/images/ovatemp-icon.png	\N	t
68	3	2	\N	\N	2014-04-01 13:57:24.320953	2014-04-01 13:57:24.320953	\N	\N	\N	logo_small_url	/images/d-logo-sketch-small.png	/images/ovatemp-icon.png	\N	t
69	3	2	\N	\N	2014-04-01 13:57:27.749868	2014-04-01 13:57:27.749868	\N	\N	\N	favicon_url	/images/default-favicon.ico	/images/ovatemp-icon.png	\N	t
70	4	2	\N	\N	2014-04-01 14:14:33.249389	2014-04-01 14:14:33.249389	\N	\N	\N	Custom stuff	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":null,"position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":"","enabled":"true","override_default_style":"false"}	\N	f
71	4	2	\N	\N	2014-04-01 14:27:24.012399	2014-04-01 14:27:24.012399	\N	\N	\N	Ovatemp	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":"","enabled":"true","override_default_style":"false"}	\N	f
72	4	2	\N	\N	2014-04-01 14:27:28.279912	2014-04-01 14:27:28.279912	\N	\N	\N	Ovatemp	{"stylesheet":".avatar {\\n  border-radius: 10px;\\n}","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":"","header":"","enabled":"true","override_default_style":"false"}	\N	f
73	3	2	\N	\N	2014-04-01 14:30:17.050712	2014-04-01 14:30:17.050712	\N	\N	\N	post_menu	like|edit|flag|delete|share|bookmark|reply	like|edit|flag|delete|share|reply	\N	t
74	3	2	\N	\N	2014-04-01 14:30:31.169219	2014-04-01 14:30:31.169219	\N	\N	\N	post_menu	like|edit|flag|delete|share|reply	like|edit|flag|delete|reply	\N	t
75	4	2	\N	\N	2014-04-01 14:30:49.644159	2014-04-01 14:30:49.644159	\N	\N	\N	Ovatemp	{"stylesheet":"","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":"","header":"","enabled":"true","override_default_style":"false"}	\N	f
76	3	2	\N	\N	2014-04-01 14:32:22.05096	2014-04-01 14:32:22.05096	\N	\N	\N	category_featured_topics	3	0	\N	t
77	3	2	\N	\N	2014-04-01 14:32:37.315655	2014-04-01 14:32:37.315655	\N	\N	\N	topics_per_period_in_top_page	50	0	\N	t
78	3	2	\N	\N	2014-04-01 14:32:49.238999	2014-04-01 14:32:49.238999	\N	\N	\N	topics_per_period_in_top_summary	20	0	\N	t
79	3	2	\N	\N	2014-04-01 14:33:43.914161	2014-04-01 14:33:43.914161	\N	\N	\N	title	Discourse	Ovatemp	\N	t
80	3	2	\N	\N	2014-04-01 14:34:01.46717	2014-04-01 14:34:01.46717	\N	\N	\N	company_full_name	My Unconfigured Forum Ltd.	Ovatemp	\N	t
81	3	2	\N	\N	2014-04-01 14:34:07.904255	2014-04-01 14:34:07.904255	\N	\N	\N	company_short_name	Unconfigured Forum	Ovatemp	\N	t
82	4	2	\N	\N	2014-04-01 14:36:45.459205	2014-04-01 14:36:45.459205	\N	\N	\N	Ovatemp	{"stylesheet":"","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":"","header":"","enabled":"true","override_default_style":"false"}	\N	f
83	4	2	\N	\N	2014-04-01 14:38:29.600295	2014-04-01 14:38:29.600295	\N	\N	\N	Ovatemp	{"stylesheet":"","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":"","header":"","enabled":"true","override_default_style":"false"}	\N	f
84	4	2	\N	\N	2014-04-01 14:38:42.795145	2014-04-01 14:38:42.795145	\N	\N	\N	Ovatemp	{"stylesheet":"","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":"","header":"","enabled":"true","override_default_style":"false"}	\N	f
85	3	2	\N	\N	2014-04-01 14:51:35.868235	2014-04-01 14:51:35.868235	\N	\N	\N	suggested_topics	5	0	\N	t
86	3	2	\N	\N	2014-04-01 14:53:11.853026	2014-04-01 14:53:11.853026	\N	\N	\N	invite_only	f	true	\N	t
87	3	2	\N	\N	2014-04-01 14:53:13.981651	2014-04-01 14:53:13.981651	\N	\N	\N	invite_only	t	false	\N	t
88	3	2	\N	\N	2014-04-01 14:53:15.273916	2014-04-01 14:53:15.273916	\N	\N	\N	enable_local_logins	t	false	\N	t
89	3	2	\N	\N	2014-04-01 14:53:22.417993	2014-04-01 14:53:22.417993	\N	\N	\N	min_password_length	8	4	\N	t
90	3	2	\N	\N	2014-04-01 14:53:32.90436	2014-04-01 14:53:32.90436	\N	\N	\N	block_common_passwords	t	false	\N	t
91	3	2	\N	\N	2014-04-01 14:53:36.357279	2014-04-01 14:53:36.357279	\N	\N	\N	enable_google_logins	t	false	\N	t
92	3	2	\N	\N	2014-04-01 14:53:37.482562	2014-04-01 14:53:37.482562	\N	\N	\N	enable_yahoo_logins	t	false	\N	t
93	3	2	\N	\N	2014-04-01 14:53:38.056137	2014-04-01 14:53:38.056137	\N	\N	\N	enable_twitter_logins	t	false	\N	t
94	3	2	\N	\N	2014-04-01 14:53:45.117127	2014-04-01 14:53:45.117127	\N	\N	\N	enable_facebook_logins	t	false	\N	t
95	3	2	\N	\N	2014-04-01 14:53:51.602767	2014-04-01 14:53:51.602767	\N	\N	\N	enable_sso	f	true	\N	t
97	3	2	\N	\N	2014-04-01 14:55:58.952391	2014-04-01 14:55:58.952391	\N	\N	\N	sso_secret		1234	\N	t
99	3	2	\N	\N	2014-04-01 14:56:16.106323	2014-04-01 14:56:16.106323	\N	\N	\N	sso_overrides_name	f	true	\N	t
100	3	2	\N	\N	2014-04-01 15:08:45.188541	2014-04-01 15:08:45.188541	\N	\N	\N	enable_mobile_theme	t	false	\N	t
102	3	2	\N	\N	2014-04-01 15:12:54.376187	2014-04-01 15:12:54.376187	\N	\N	\N	enable_mobile_theme	t	false	\N	t
106	3	2	\N	\N	2014-04-01 15:21:21.565364	2014-04-01 15:21:21.565364	\N	\N	\N	allow_index_in_robots_txt	t	false	\N	t
96	3	2	\N	\N	2014-04-01 14:55:54.879677	2014-04-01 14:55:54.879677	\N	\N	\N	sso_url		http://localhost:3000/api/community	\N	t
98	3	2	\N	\N	2014-04-01 14:56:12.519116	2014-04-01 14:56:12.519116	\N	\N	\N	sso_overrides_username	f	true	\N	t
101	3	2	\N	\N	2014-04-01 15:12:44.384447	2014-04-01 15:12:44.384447	\N	\N	\N	enable_mobile_theme	f	true	\N	t
103	3	2	\N	\N	2014-04-01 15:16:30.742248	2014-04-01 15:16:30.742248	\N	\N	\N	enable_mobile_theme	f	true	\N	t
104	3	2	\N	\N	2014-04-01 15:18:17.014735	2014-04-01 15:18:17.014735	\N	\N	\N	share_links	twitter|facebook|google+|email		\N	t
105	3	2	\N	\N	2014-04-01 15:21:18.347814	2014-04-01 15:21:18.347814	\N	\N	\N	enable_noscript_support	t	false	\N	t
107	3	2	\N	\N	2014-04-01 15:21:31.042702	2014-04-01 15:21:31.042702	\N	\N	\N	enable_escaped_fragments	t	false	\N	t
108	8	\N	2	\N	2014-04-01 16:00:04.075561	2014-04-01 16:00:04.075561	\N	\N	\N	\N	\N	\N	10	f
109	3	2	\N	\N	2014-04-01 16:05:34.932172	2014-04-01 16:05:34.932172	\N	\N	\N	suggested_topics	5	0	\N	t
110	3	2	\N	\N	2014-04-01 16:05:47.945247	2014-04-01 16:05:47.945247	\N	\N	\N	post_menu	like|edit|flag|delete|share|bookmark|reply	like|edit|flag|delete|reply	\N	t
111	3	2	\N	\N	2014-04-01 16:05:56.179812	2014-04-01 16:05:56.179812	\N	\N	\N	top_menu	latest|new|unread|starred|top|categories	latest|new|unread|starred|top	\N	t
112	6	\N	-1	\N	2014-04-01 16:13:29.567213	2014-04-01 16:13:29.567213	\N	\N	\N	\N	\N	\N	\N	f
113	3	2	\N	\N	2014-04-01 16:15:45.190388	2014-04-01 16:15:45.190388	\N	\N	\N	post_menu	like|edit|flag|delete|share|bookmark|reply	like|edit|flag|delete|reply	\N	t
114	3	2	\N	\N	2014-04-01 16:15:49.586295	2014-04-01 16:15:49.586295	\N	\N	\N	top_menu	latest|new|unread|starred|top|categories	latest|new|unread|starred|top	\N	t
115	3	2	\N	\N	2014-04-01 16:15:53.443634	2014-04-01 16:15:53.443634	\N	\N	\N	share_links	twitter|facebook|google+|email		\N	t
116	3	2	\N	\N	2014-04-01 16:16:00.778542	2014-04-01 16:16:00.778542	\N	\N	\N	category_featured_topics	3	0	\N	t
117	3	2	\N	\N	2014-04-01 16:16:37.103312	2014-04-01 16:16:37.103312	\N	\N	\N	logo_url	/images/d-logo-sketch.png	/images/ovatemp-icon.png	\N	t
118	3	2	\N	\N	2014-04-01 16:16:41.781983	2014-04-01 16:16:41.781983	\N	\N	\N	logo_small_url	/images/d-logo-sketch-small.png	/images/ovatemp-icon.png	\N	t
119	3	2	\N	\N	2014-04-01 16:16:44.584006	2014-04-01 16:16:44.584006	\N	\N	\N	favicon_url	/images/default-favicon.ico	/images/ovatemp-icon.png	\N	t
120	3	2	\N	\N	2014-04-01 16:16:50.852928	2014-04-01 16:16:50.852928	\N	\N	\N	title	Discourse	Ovatemp	\N	t
121	3	2	\N	\N	2014-04-01 16:17:20.586301	2014-04-01 16:17:20.586301	\N	\N	\N	apple_touch_icon_url	/images/default-apple-touch-icon.png	/images/ovatemp-icon.png	\N	t
122	3	2	\N	\N	2014-04-01 16:17:33.553486	2014-04-01 16:17:33.553486	\N	\N	\N	invite_only	f	true	\N	t
123	3	2	\N	\N	2014-04-01 16:17:37.109761	2014-04-01 16:17:37.109761	\N	\N	\N	login_required	f	true	\N	t
124	3	2	\N	\N	2014-04-01 16:17:40.839663	2014-04-01 16:17:40.839663	\N	\N	\N	login_required	t	false	\N	t
125	3	2	\N	\N	2014-04-01 16:17:56.224405	2014-04-01 16:17:56.224405	\N	\N	\N	enable_local_logins	t	false	\N	t
126	3	2	\N	\N	2014-04-01 16:18:01.005761	2014-04-01 16:18:01.005761	\N	\N	\N	min_password_length	8	4	\N	t
127	3	2	\N	\N	2014-04-01 16:18:03.085888	2014-04-01 16:18:03.085888	\N	\N	\N	block_common_passwords	t	false	\N	t
128	3	2	\N	\N	2014-04-01 16:18:04.511817	2014-04-01 16:18:04.511817	\N	\N	\N	enable_google_logins	t	false	\N	t
129	3	2	\N	\N	2014-04-01 16:18:05.016046	2014-04-01 16:18:05.016046	\N	\N	\N	enable_yahoo_logins	t	false	\N	t
130	3	2	\N	\N	2014-04-01 16:18:05.666826	2014-04-01 16:18:05.666826	\N	\N	\N	enable_twitter_logins	t	false	\N	t
131	3	2	\N	\N	2014-04-01 16:18:07.488959	2014-04-01 16:18:07.488959	\N	\N	\N	enable_facebook_logins	t	false	\N	t
132	3	2	\N	\N	2014-04-01 16:18:10.051023	2014-04-01 16:18:10.051023	\N	\N	\N	enable_sso	f	true	\N	t
133	3	2	\N	\N	2014-04-01 16:18:16.959571	2014-04-01 16:18:16.959571	\N	\N	\N	sso_url		http://localhost:3001/api/community	\N	t
134	3	2	\N	\N	2014-04-01 16:18:19.311138	2014-04-01 16:18:19.311138	\N	\N	\N	sso_secret		1234	\N	t
135	3	2	\N	\N	2014-04-01 16:18:21.751184	2014-04-01 16:18:21.751184	\N	\N	\N	sso_overrides_email	f	true	\N	t
136	3	2	\N	\N	2014-04-01 16:18:22.4699	2014-04-01 16:18:22.4699	\N	\N	\N	sso_overrides_username	f	true	\N	t
137	3	2	\N	\N	2014-04-01 16:18:23.314247	2014-04-01 16:18:23.314247	\N	\N	\N	sso_overrides_name	f	true	\N	t
138	3	2	\N	\N	2014-04-01 16:18:25.406765	2014-04-01 16:18:25.406765	\N	\N	\N	enforce_global_nicknames	f	true	\N	t
139	3	2	\N	\N	2014-04-01 16:18:27.255107	2014-04-01 16:18:27.255107	\N	\N	\N	enforce_global_nicknames	t	false	\N	t
140	3	2	\N	\N	2014-04-01 16:18:40.053467	2014-04-01 16:18:40.053467	\N	\N	\N	email_editable	t	false	\N	t
141	3	2	\N	\N	2014-04-01 16:18:44.69091	2014-04-01 16:18:44.69091	\N	\N	\N	redirect_users_to_top_page	t	false	\N	t
142	3	2	\N	\N	2014-04-01 16:18:53.330879	2014-04-01 16:18:53.330879	\N	\N	\N	min_post_length	20	10	\N	t
143	3	2	\N	\N	2014-04-01 16:19:22.749798	2014-04-01 16:19:22.749798	\N	\N	\N	allow_duplicate_topic_titles	f	true	\N	t
144	3	2	\N	\N	2014-04-01 16:19:26.470909	2014-04-01 16:19:26.470909	\N	\N	\N	allow_duplicate_topic_titles	t	false	\N	t
145	3	2	\N	\N	2014-04-01 16:21:03.495043	2014-04-01 16:21:03.495043	\N	\N	\N	send_welcome_message	t	false	\N	t
146	3	2	\N	\N	2014-04-01 16:21:09.084199	2014-04-01 16:21:09.084199	\N	\N	\N	new_version_emails	t	false	\N	t
147	3	2	\N	\N	2014-04-01 16:21:10.648923	2014-04-01 16:21:10.648923	\N	\N	\N	suppress_uncategorized_badge	t	false	\N	t
148	3	2	\N	\N	2014-04-01 16:21:44.89097	2014-04-01 16:21:44.89097	\N	\N	\N	allow_uncategorized_topics	t	false	\N	t
149	3	2	\N	\N	2014-04-01 17:57:43.020237	2014-04-01 17:57:43.020237	\N	\N	\N	suggested_topics	5	0	\N	t
150	4	2	\N	\N	2014-04-01 18:41:18.667252	2014-04-01 18:41:18.667252	\N	\N	\N	Ovatemp	{"stylesheet":"","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":"","header":"","enabled":"true","override_default_style":"false"}	\N	f
151	4	2	\N	\N	2014-04-01 18:42:30.840837	2014-04-01 18:42:30.840837	\N	\N	\N	Ovatemp	{"stylesheet":"","header":"","position":1,"enabled":true,"key":"70c2f5db-4132-4615-82ec-c27b404a26b9","override_default_style":false}	{"stylesheet":"","header":"","enabled":"true","override_default_style":"false"}	\N	f
\.


--
-- Name: user_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('user_histories_id_seq', 151, true);


--
-- Data for Name: user_open_ids; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY user_open_ids (id, user_id, email, url, created_at, updated_at, active) FROM stdin;
\.


--
-- Name: user_open_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('user_open_ids_id_seq', 1, false);


--
-- Data for Name: user_search_data; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY user_search_data (user_id, search_data) FROM stdin;
-1	'system':1,2
1	'jamie':2 'jgaskins':1
2	'jamie':1,2
\.


--
-- Data for Name: user_stats; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY user_stats (user_id, has_custom_avatar, topics_entered, time_read, days_visited, posts_read_count, likes_given, likes_received, topic_reply_count, new_since) FROM stdin;
-1	f	0	0	0	0	0	0	0	2014-03-31 15:09:51.162575
1	f	0	0	1	0	0	0	0	2014-03-31 15:11:26.170267
2	f	13	4577	2	17	0	0	1	2014-03-31 15:21:08.938424
\.


--
-- Data for Name: user_visits; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY user_visits (id, user_id, visited_at, posts_read) FROM stdin;
1	1	2014-03-31	0
2	2	2014-03-31	4
3	2	2014-04-01	4
\.


--
-- Name: user_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('user_visits_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY users (id, username, created_at, updated_at, name, bio_raw, seen_notification_id, last_posted_at, email, password_hash, salt, active, username_lower, auth_token, last_seen_at, website, admin, last_emailed_at, email_digests, trust_level, bio_cooked, email_private_messages, email_direct, approved, approved_by_id, approved_at, digest_after_days, previous_visit_at, suspended_at, suspended_till, date_of_birth, auto_track_topics_after_msecs, views, flag_level, ip_address, new_topic_duration_minutes, external_links_in_new_tab, enable_quoting, moderator, blocked, dynamic_favicon, title, use_uploaded_avatar, uploaded_avatar_template, uploaded_avatar_id, email_always, mailing_list_mode, locale, primary_group_id, profile_background) FROM stdin;
2	jamie	2014-03-31 15:21:08.930541	2014-04-01 16:00:10.199425	Jamie	\N	4	2014-04-01 16:00:10.171115	jgaskins@gmail.com	\N	\N	t	jamie	4ab6116ac230bca86c91887230642565	2014-04-01 18:45:00.251044	\N	t	\N	t	0	\N	t	t	f	\N	\N	7	2014-04-01 16:34:40.807183	\N	\N	\N	\N	0	0	127.0.0.1	\N	f	t	f	f	f	\N	f	\N	\N	f	f	\N	\N	\N
1	jgaskins	2014-03-31 15:11:26.070365	2014-04-01 16:27:14.310777	Jamie	\N	0	2014-04-01 16:27:14.254441	jamie@inthebackforty.com	955479fa8971ce6d5c60beac5b7951c1938ec4db166b9c1c218c2c1e54f4d102	07e3b54b3487675181f3abb76ad200fa	t	jgaskins	088aa81922881d21811ba521cfc71fba	2014-03-31 15:21:07.719855	\N	t	\N	t	0	\N	t	t	f	\N	\N	7	\N	\N	\N	\N	\N	0	0	127.0.0.1	\N	f	t	f	f	f	\N	f	\N	\N	f	f	\N	\N	\N
-1	system	2014-03-31 15:09:51.146694	2014-04-01 16:14:12.213898	system	Not a real person. A global user for system notifications and other system tasks.	0	2014-03-31 15:09:52.900193	no_email	55e1250f4c851454eb3fd98283931f14178080d43700b0fb8cd0ab546476aa3a	14588c6ac498362023c1b10fe89534cd	t	system	\N	\N	\N	t	\N	t	4	<p>Not a real person. A global user for system notifications and other system tasks.</p>	f	f	t	\N	\N	7	\N	\N	\N	\N	\N	0	0	\N	\N	f	t	t	f	f	\N	f	\N	\N	f	f	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY versions (id, versioned_id, versioned_type, user_id, user_type, user_name, modifications, number, reverted_from, tag, created_at, updated_at) FROM stdin;
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamie
--

SELECT pg_catalog.setval('versions_id_seq', 1, false);


--
-- Data for Name: views; Type: TABLE DATA; Schema: public; Owner: jamie
--

COPY views (parent_id, parent_type, viewed_at, user_id, ip_address) FROM stdin;
6	Topic	2014-04-01	2	127.0.0.1
9	Topic	2014-04-01	2	127.0.0.1
1	Topic	2014-04-01	2	127.0.0.1
5	Topic	2014-04-01	2	127.0.0.1
10	Topic	2014-04-01	2	127.0.0.1
11	Topic	2014-04-01	2	127.0.0.1
12	Topic	2014-04-01	2	127.0.0.1
13	Topic	2014-04-01	2	127.0.0.1
14	Topic	2014-04-01	2	127.0.0.1
4	Topic	2014-04-01	2	127.0.0.1
15	Topic	2014-04-01	2	127.0.0.1
16	Topic	2014-04-01	2	127.0.0.1
17	Topic	2014-04-01	2	127.0.0.1
\.


--
-- Name: actions_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY user_actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);


--
-- Name: api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: badge_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY badge_types
    ADD CONSTRAINT badge_types_pkey PRIMARY KEY (id);


--
-- Name: badges_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: blocked_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY screened_emails
    ADD CONSTRAINT blocked_emails_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_search_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY category_search_data
    ADD CONSTRAINT categories_search_pkey PRIMARY KEY (category_id);


--
-- Name: category_featured_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY category_featured_topics
    ADD CONSTRAINT category_featured_topics_pkey PRIMARY KEY (id);


--
-- Name: category_featured_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY category_featured_users
    ADD CONSTRAINT category_featured_users_pkey PRIMARY KEY (id);


--
-- Name: category_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY category_groups
    ADD CONSTRAINT category_groups_pkey PRIMARY KEY (id);


--
-- Name: category_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY category_users
    ADD CONSTRAINT category_users_pkey PRIMARY KEY (id);


--
-- Name: draft_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY draft_sequences
    ADD CONSTRAINT draft_sequences_pkey PRIMARY KEY (id);


--
-- Name: drafts_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY drafts
    ADD CONSTRAINT drafts_pkey PRIMARY KEY (id);


--
-- Name: email_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY email_logs
    ADD CONSTRAINT email_logs_pkey PRIMARY KEY (id);


--
-- Name: email_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY email_tokens
    ADD CONSTRAINT email_tokens_pkey PRIMARY KEY (id);


--
-- Name: facebook_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY facebook_user_infos
    ADD CONSTRAINT facebook_user_infos_pkey PRIMARY KEY (id);


--
-- Name: forum_thread_link_clicks_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topic_link_clicks
    ADD CONSTRAINT forum_thread_link_clicks_pkey PRIMARY KEY (id);


--
-- Name: forum_thread_links_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topic_links
    ADD CONSTRAINT forum_thread_links_pkey PRIMARY KEY (id);


--
-- Name: forum_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT forum_threads_pkey PRIMARY KEY (id);


--
-- Name: github_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY github_user_infos
    ADD CONSTRAINT github_user_infos_pkey PRIMARY KEY (id);


--
-- Name: group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY group_users
    ADD CONSTRAINT group_users_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: incoming_links_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY incoming_links
    ADD CONSTRAINT incoming_links_pkey PRIMARY KEY (id);


--
-- Name: invites_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: message_bus_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY message_bus
    ADD CONSTRAINT message_bus_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: oauth2_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY oauth2_user_infos
    ADD CONSTRAINT oauth2_user_infos_pkey PRIMARY KEY (id);


--
-- Name: optimized_images_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY optimized_images
    ADD CONSTRAINT optimized_images_pkey PRIMARY KEY (id);


--
-- Name: plugin_store_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY plugin_store_rows
    ADD CONSTRAINT plugin_store_rows_pkey PRIMARY KEY (id);


--
-- Name: post_action_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY post_action_types
    ADD CONSTRAINT post_action_types_pkey PRIMARY KEY (id);


--
-- Name: post_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY post_actions
    ADD CONSTRAINT post_actions_pkey PRIMARY KEY (id);


--
-- Name: post_details_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY post_details
    ADD CONSTRAINT post_details_pkey PRIMARY KEY (id);


--
-- Name: post_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY post_revisions
    ADD CONSTRAINT post_revisions_pkey PRIMARY KEY (id);


--
-- Name: post_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY post_uploads
    ADD CONSTRAINT post_uploads_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_search_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY post_search_data
    ADD CONSTRAINT posts_search_pkey PRIMARY KEY (post_id);


--
-- Name: screened_ip_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY screened_ip_addresses
    ADD CONSTRAINT screened_ip_addresses_pkey PRIMARY KEY (id);


--
-- Name: screened_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY screened_urls
    ADD CONSTRAINT screened_urls_pkey PRIMARY KEY (id);


--
-- Name: single_sign_on_records_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY single_sign_on_records
    ADD CONSTRAINT single_sign_on_records_pkey PRIMARY KEY (id);


--
-- Name: site_customizations_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY site_customizations
    ADD CONSTRAINT site_customizations_pkey PRIMARY KEY (id);


--
-- Name: site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: top_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY top_topics
    ADD CONSTRAINT top_topics_pkey PRIMARY KEY (id);


--
-- Name: topic_allowed_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topic_allowed_groups
    ADD CONSTRAINT topic_allowed_groups_pkey PRIMARY KEY (id);


--
-- Name: topic_allowed_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topic_allowed_users
    ADD CONSTRAINT topic_allowed_users_pkey PRIMARY KEY (id);


--
-- Name: topic_embeds_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topic_embeds
    ADD CONSTRAINT topic_embeds_pkey PRIMARY KEY (id);


--
-- Name: topic_invites_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topic_invites
    ADD CONSTRAINT topic_invites_pkey PRIMARY KEY (id);


--
-- Name: topic_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY topic_users
    ADD CONSTRAINT topic_users_pkey PRIMARY KEY (id);


--
-- Name: twitter_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY twitter_user_infos
    ADD CONSTRAINT twitter_user_infos_pkey PRIMARY KEY (id);


--
-- Name: uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- Name: user_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY user_badges
    ADD CONSTRAINT user_badges_pkey PRIMARY KEY (id);


--
-- Name: user_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY user_histories
    ADD CONSTRAINT user_histories_pkey PRIMARY KEY (id);


--
-- Name: user_open_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY user_open_ids
    ADD CONSTRAINT user_open_ids_pkey PRIMARY KEY (id);


--
-- Name: user_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY user_stats
    ADD CONSTRAINT user_stats_pkey PRIMARY KEY (user_id);


--
-- Name: user_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY user_visits
    ADD CONSTRAINT user_visits_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_search_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY user_search_data
    ADD CONSTRAINT users_search_pkey PRIMARY KEY (user_id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: jamie; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: by_link; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX by_link ON topic_link_clicks USING btree (topic_link_id);


--
-- Name: cat_featured_threads; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX cat_featured_threads ON category_featured_topics USING btree (category_id, topic_id);


--
-- Name: idx_posts_created_at_topic_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX idx_posts_created_at_topic_id ON posts USING btree (created_at, topic_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_posts_user_id_deleted_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX idx_posts_user_id_deleted_at ON posts USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_search_category; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX idx_search_category ON category_search_data USING gin (search_data);


--
-- Name: idx_search_post; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX idx_search_post ON post_search_data USING gin (search_data);


--
-- Name: idx_search_user; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX idx_search_user ON user_search_data USING gin (search_data);


--
-- Name: idx_topics_front_page; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX idx_topics_front_page ON topics USING btree (deleted_at, visible, archetype, category_id, id);


--
-- Name: idx_topics_user_id_deleted_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX idx_topics_user_id_deleted_at ON topics USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_unique_actions; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX idx_unique_actions ON post_actions USING btree (user_id, post_action_type_id, post_id, deleted_at);


--
-- Name: idx_unique_post_uploads; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX idx_unique_post_uploads ON post_uploads USING btree (post_id, upload_id);


--
-- Name: idx_unique_rows; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX idx_unique_rows ON user_actions USING btree (action_type, user_id, target_topic_id, target_post_id, acting_user_id);


--
-- Name: incoming_index; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX incoming_index ON incoming_links USING btree (topic_id, post_number);


--
-- Name: index_api_keys_on_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_api_keys_on_key ON api_keys USING btree (key);


--
-- Name: index_api_keys_on_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_api_keys_on_user_id ON api_keys USING btree (user_id);


--
-- Name: index_badge_types_on_name; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_badge_types_on_name ON badge_types USING btree (name);


--
-- Name: index_badges_on_name; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_badges_on_name ON badges USING btree (name);


--
-- Name: index_categories_on_email_in; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_categories_on_email_in ON categories USING btree (email_in);


--
-- Name: index_categories_on_name; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_categories_on_name ON categories USING btree (name);


--
-- Name: index_categories_on_topic_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_categories_on_topic_count ON categories USING btree (topic_count);


--
-- Name: index_category_featured_topics_on_category_id_and_rank; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_category_featured_topics_on_category_id_and_rank ON category_featured_topics USING btree (category_id, rank);


--
-- Name: index_category_featured_users_on_category_id_and_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_category_featured_users_on_category_id_and_user_id ON category_featured_users USING btree (category_id, user_id);


--
-- Name: index_draft_sequences_on_user_id_and_draft_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_draft_sequences_on_user_id_and_draft_key ON draft_sequences USING btree (user_id, draft_key);


--
-- Name: index_drafts_on_user_id_and_draft_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_drafts_on_user_id_and_draft_key ON drafts USING btree (user_id, draft_key);


--
-- Name: index_email_logs_on_created_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_email_logs_on_created_at ON email_logs USING btree (created_at DESC);


--
-- Name: index_email_logs_on_reply_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_email_logs_on_reply_key ON email_logs USING btree (reply_key);


--
-- Name: index_email_logs_on_skipped_and_created_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_email_logs_on_skipped_and_created_at ON email_logs USING btree (skipped, created_at);


--
-- Name: index_email_logs_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_email_logs_on_user_id_and_created_at ON email_logs USING btree (user_id, created_at DESC);


--
-- Name: index_email_tokens_on_token; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_email_tokens_on_token ON email_tokens USING btree (token);


--
-- Name: index_facebook_user_infos_on_facebook_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_facebook_user_infos_on_facebook_user_id ON facebook_user_infos USING btree (facebook_user_id);


--
-- Name: index_facebook_user_infos_on_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_facebook_user_infos_on_user_id ON facebook_user_infos USING btree (user_id);


--
-- Name: index_github_user_infos_on_github_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_github_user_infos_on_github_user_id ON github_user_infos USING btree (github_user_id);


--
-- Name: index_github_user_infos_on_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_github_user_infos_on_user_id ON github_user_infos USING btree (user_id);


--
-- Name: index_group_users_on_group_id_and_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_group_users_on_group_id_and_user_id ON group_users USING btree (group_id, user_id);


--
-- Name: index_groups_on_name; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_groups_on_name ON groups USING btree (name);


--
-- Name: index_incoming_links_on_created_at_and_domain; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_incoming_links_on_created_at_and_domain ON incoming_links USING btree (created_at, domain);


--
-- Name: index_incoming_links_on_created_at_and_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_incoming_links_on_created_at_and_user_id ON incoming_links USING btree (created_at, user_id);


--
-- Name: index_invites_on_email_and_invited_by_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_invites_on_email_and_invited_by_id ON invites USING btree (email, invited_by_id);


--
-- Name: index_invites_on_invite_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_invites_on_invite_key ON invites USING btree (invite_key);


--
-- Name: index_message_bus_on_created_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_message_bus_on_created_at ON message_bus USING btree (created_at);


--
-- Name: index_notifications_on_post_action_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_notifications_on_post_action_id ON notifications USING btree (post_action_id);


--
-- Name: index_notifications_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_notifications_on_user_id_and_created_at ON notifications USING btree (user_id, created_at);


--
-- Name: index_oauth2_user_infos_on_uid_and_provider; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth2_user_infos_on_uid_and_provider ON oauth2_user_infos USING btree (uid, provider);


--
-- Name: index_optimized_images_on_upload_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_optimized_images_on_upload_id ON optimized_images USING btree (upload_id);


--
-- Name: index_optimized_images_on_upload_id_and_width_and_height; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_optimized_images_on_upload_id_and_width_and_height ON optimized_images USING btree (upload_id, width, height);


--
-- Name: index_plugin_store_rows_on_plugin_name_and_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_plugin_store_rows_on_plugin_name_and_key ON plugin_store_rows USING btree (plugin_name, key);


--
-- Name: index_post_actions_on_post_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_post_actions_on_post_id ON post_actions USING btree (post_id);


--
-- Name: index_post_details_on_post_id_and_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_post_details_on_post_id_and_key ON post_details USING btree (post_id, key);


--
-- Name: index_post_replies_on_post_id_and_reply_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_post_replies_on_post_id_and_reply_id ON post_replies USING btree (post_id, reply_id);


--
-- Name: index_post_revisions_on_post_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_post_revisions_on_post_id ON post_revisions USING btree (post_id);


--
-- Name: index_post_revisions_on_post_id_and_number; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_post_revisions_on_post_id_and_number ON post_revisions USING btree (post_id, number);


--
-- Name: index_posts_on_reply_to_post_number; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_posts_on_reply_to_post_number ON posts USING btree (reply_to_post_number);


--
-- Name: index_posts_on_topic_id_and_post_number; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_posts_on_topic_id_and_post_number ON posts USING btree (topic_id, post_number);


--
-- Name: index_screened_emails_on_email; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_screened_emails_on_email ON screened_emails USING btree (email);


--
-- Name: index_screened_emails_on_last_match_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_screened_emails_on_last_match_at ON screened_emails USING btree (last_match_at);


--
-- Name: index_screened_ip_addresses_on_ip_address; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_screened_ip_addresses_on_ip_address ON screened_ip_addresses USING btree (ip_address);


--
-- Name: index_screened_ip_addresses_on_last_match_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_screened_ip_addresses_on_last_match_at ON screened_ip_addresses USING btree (last_match_at);


--
-- Name: index_screened_urls_on_last_match_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_screened_urls_on_last_match_at ON screened_urls USING btree (last_match_at);


--
-- Name: index_screened_urls_on_url; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_screened_urls_on_url ON screened_urls USING btree (url);


--
-- Name: index_single_sign_on_records_on_external_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_single_sign_on_records_on_external_id ON single_sign_on_records USING btree (external_id);


--
-- Name: index_site_contents_on_content_type; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_site_contents_on_content_type ON site_contents USING btree (content_type);


--
-- Name: index_site_customizations_on_key; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_site_customizations_on_key ON site_customizations USING btree (key);


--
-- Name: index_top_topics_on_daily_likes_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_daily_likes_count ON top_topics USING btree (daily_likes_count DESC);


--
-- Name: index_top_topics_on_daily_posts_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_daily_posts_count ON top_topics USING btree (daily_posts_count DESC);


--
-- Name: index_top_topics_on_daily_views_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_daily_views_count ON top_topics USING btree (daily_views_count DESC);


--
-- Name: index_top_topics_on_monthly_likes_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_monthly_likes_count ON top_topics USING btree (monthly_likes_count DESC);


--
-- Name: index_top_topics_on_monthly_posts_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_monthly_posts_count ON top_topics USING btree (monthly_posts_count DESC);


--
-- Name: index_top_topics_on_monthly_views_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_monthly_views_count ON top_topics USING btree (monthly_views_count DESC);


--
-- Name: index_top_topics_on_topic_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_top_topics_on_topic_id ON top_topics USING btree (topic_id);


--
-- Name: index_top_topics_on_weekly_likes_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_weekly_likes_count ON top_topics USING btree (weekly_likes_count DESC);


--
-- Name: index_top_topics_on_weekly_posts_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_weekly_posts_count ON top_topics USING btree (weekly_posts_count DESC);


--
-- Name: index_top_topics_on_weekly_views_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_weekly_views_count ON top_topics USING btree (weekly_views_count DESC);


--
-- Name: index_top_topics_on_yearly_likes_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_yearly_likes_count ON top_topics USING btree (yearly_likes_count DESC);


--
-- Name: index_top_topics_on_yearly_posts_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_yearly_posts_count ON top_topics USING btree (yearly_posts_count DESC);


--
-- Name: index_top_topics_on_yearly_views_count; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_top_topics_on_yearly_views_count ON top_topics USING btree (yearly_views_count DESC);


--
-- Name: index_topic_allowed_groups_on_group_id_and_topic_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_topic_allowed_groups_on_group_id_and_topic_id ON topic_allowed_groups USING btree (group_id, topic_id);


--
-- Name: index_topic_allowed_groups_on_topic_id_and_group_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_topic_allowed_groups_on_topic_id_and_group_id ON topic_allowed_groups USING btree (topic_id, group_id);


--
-- Name: index_topic_allowed_users_on_topic_id_and_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_topic_allowed_users_on_topic_id_and_user_id ON topic_allowed_users USING btree (topic_id, user_id);


--
-- Name: index_topic_allowed_users_on_user_id_and_topic_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_topic_allowed_users_on_user_id_and_topic_id ON topic_allowed_users USING btree (user_id, topic_id);


--
-- Name: index_topic_embeds_on_embed_url; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_topic_embeds_on_embed_url ON topic_embeds USING btree (embed_url);


--
-- Name: index_topic_invites_on_invite_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_topic_invites_on_invite_id ON topic_invites USING btree (invite_id);


--
-- Name: index_topic_invites_on_topic_id_and_invite_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_topic_invites_on_topic_id_and_invite_id ON topic_invites USING btree (topic_id, invite_id);


--
-- Name: index_topic_links_on_topic_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_topic_links_on_topic_id ON topic_links USING btree (topic_id);


--
-- Name: index_topic_users_on_topic_id_and_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_topic_users_on_topic_id_and_user_id ON topic_users USING btree (topic_id, user_id);


--
-- Name: index_topics_on_bumped_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_topics_on_bumped_at ON topics USING btree (bumped_at DESC);


--
-- Name: index_topics_on_id_and_deleted_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_topics_on_id_and_deleted_at ON topics USING btree (id, deleted_at);


--
-- Name: index_twitter_user_infos_on_twitter_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_twitter_user_infos_on_twitter_user_id ON twitter_user_infos USING btree (twitter_user_id);


--
-- Name: index_twitter_user_infos_on_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_twitter_user_infos_on_user_id ON twitter_user_infos USING btree (user_id);


--
-- Name: index_uploads_on_id_and_url; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_uploads_on_id_and_url ON uploads USING btree (id, url);


--
-- Name: index_uploads_on_sha1; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_uploads_on_sha1 ON uploads USING btree (sha1);


--
-- Name: index_uploads_on_url; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_uploads_on_url ON uploads USING btree (url);


--
-- Name: index_uploads_on_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_uploads_on_user_id ON uploads USING btree (user_id);


--
-- Name: index_user_actions_on_acting_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_user_actions_on_acting_user_id ON user_actions USING btree (acting_user_id);


--
-- Name: index_user_actions_on_user_id_and_action_type; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_user_actions_on_user_id_and_action_type ON user_actions USING btree (user_id, action_type);


--
-- Name: index_user_badges_on_badge_id_and_user_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_user_badges_on_badge_id_and_user_id ON user_badges USING btree (badge_id, user_id);


--
-- Name: index_user_histories_on_acting_user_id_and_action_and_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_user_histories_on_acting_user_id_and_action_and_id ON user_histories USING btree (acting_user_id, action, id);


--
-- Name: index_user_histories_on_action_and_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_user_histories_on_action_and_id ON user_histories USING btree (action, id);


--
-- Name: index_user_histories_on_subject_and_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_user_histories_on_subject_and_id ON user_histories USING btree (subject, id);


--
-- Name: index_user_histories_on_target_user_id_and_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_user_histories_on_target_user_id_and_id ON user_histories USING btree (target_user_id, id);


--
-- Name: index_user_open_ids_on_url; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_user_open_ids_on_url ON user_open_ids USING btree (url);


--
-- Name: index_user_visits_on_user_id_and_visited_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_user_visits_on_user_id_and_visited_at ON user_visits USING btree (user_id, visited_at);


--
-- Name: index_users_on_auth_token; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_users_on_auth_token ON users USING btree (auth_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_last_posted_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_users_on_last_posted_at ON users USING btree (last_posted_at);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: index_users_on_username_lower; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_username_lower ON users USING btree (username_lower);


--
-- Name: index_versions_on_created_at; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_versions_on_created_at ON versions USING btree (created_at);


--
-- Name: index_versions_on_number; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_versions_on_number ON versions USING btree (number);


--
-- Name: index_versions_on_tag; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_versions_on_tag ON versions USING btree (tag);


--
-- Name: index_versions_on_user_id_and_user_type; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_versions_on_user_id_and_user_type ON versions USING btree (user_id, user_type);


--
-- Name: index_versions_on_user_name; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_versions_on_user_name ON versions USING btree (user_name);


--
-- Name: index_versions_on_versioned_id_and_versioned_type; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_versions_on_versioned_id_and_versioned_type ON versions USING btree (versioned_id, versioned_type);


--
-- Name: index_views_on_parent_id_and_parent_type; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_views_on_parent_id_and_parent_type ON views USING btree (parent_id, parent_type);


--
-- Name: index_views_on_user_id_and_parent_type_and_parent_id; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX index_views_on_user_id_and_parent_type_and_parent_id ON views USING btree (user_id, parent_type, parent_id);


--
-- Name: post_timings_summary; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE INDEX post_timings_summary ON post_timings USING btree (topic_id, post_number);


--
-- Name: post_timings_unique; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX post_timings_unique ON post_timings USING btree (topic_id, post_number, user_id);


--
-- Name: unique_post_links; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX unique_post_links ON topic_links USING btree (topic_id, post_id, url);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: jamie; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: jamie
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jamie;
GRANT ALL ON SCHEMA public TO jamie;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

