PGDMP     ,                    x         	   ihweb_new    9.6.12    12.2     q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            t           1262    106623 	   ihweb_new    DATABASE     �   CREATE DATABASE ihweb_new WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE ihweb_new;
                postgres    false            �            1259    123023    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    text text NOT NULL,
    comments_user_id integer,
    comments_news_id integer
);
    DROP TABLE public.comments;
       public            postgres    false            �            1259    123021    comments_id_seq    SEQUENCE     x   CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false            �            1259    106640    migration_versions    TABLE     �   CREATE TABLE public.migration_versions (
    version character varying(14) NOT NULL,
    executed_at timestamp(0) without time zone NOT NULL
);
 &   DROP TABLE public.migration_versions;
       public            postgres    false            u           0    0 %   COLUMN migration_versions.executed_at    COMMENT     [   COMMENT ON COLUMN public.migration_versions.executed_at IS '(DC2Type:datetime_immutable)';
          public          postgres    false    186            �            1259    123007    news    TABLE     �   CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    description text NOT NULL,
    number_of_views bigint NOT NULL,
    news_user_id integer
);
    DROP TABLE public.news;
       public            postgres    false            �            1259    106656    news_id_seq    SEQUENCE     t   CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public          postgres    false            �            1259    106645    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public."user";
       public            postgres    false            �            1259    106629    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            n          0    123023    comments 
   TABLE DATA           P   COPY public.comments (id, text, comments_user_id, comments_news_id) FROM stdin;
    public          postgres    false    191   I        i          0    106640    migration_versions 
   TABLE DATA           B   COPY public.migration_versions (version, executed_at) FROM stdin;
    public          postgres    false    186   �        l          0    123007    news 
   TABLE DATA           [   COPY public.news (id, title, date, description, number_of_views, news_user_id) FROM stdin;
    public          postgres    false    189   6!       j          0    106645    user 
   TABLE DATA           <   COPY public."user" (id, email, roles, password) FROM stdin;
    public          postgres    false    187   "       v           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 27, true);
          public          postgres    false    190            w           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 8, true);
          public          postgres    false    188            x           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 6, true);
          public          postgres    false    185            �           2606    123030    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    191            �           2606    106644 *   migration_versions migration_versions_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);
 T   ALTER TABLE ONLY public.migration_versions DROP CONSTRAINT migration_versions_pkey;
       public            postgres    false    186            �           2606    123014    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    189            �           2606    106652    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    187            �           1259    123020    idx_1dd39950f08acf73    INDEX     M   CREATE INDEX idx_1dd39950f08acf73 ON public.news USING btree (news_user_id);
 (   DROP INDEX public.idx_1dd39950f08acf73;
       public            postgres    false    189            �           1259    123036    idx_5f9e962aaaa72059    INDEX     U   CREATE INDEX idx_5f9e962aaaa72059 ON public.comments USING btree (comments_user_id);
 (   DROP INDEX public.idx_5f9e962aaaa72059;
       public            postgres    false    191            �           1259    123042    idx_5f9e962ab86daa6c    INDEX     U   CREATE INDEX idx_5f9e962ab86daa6c ON public.comments USING btree (comments_news_id);
 (   DROP INDEX public.idx_5f9e962ab86daa6c;
       public            postgres    false    191            �           1259    106653    uniq_8d93d649e7927c74    INDEX     P   CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);
 )   DROP INDEX public.uniq_8d93d649e7927c74;
       public            postgres    false    187            �           2606    123015    news fk_1dd39950f08acf73    FK CONSTRAINT     }   ALTER TABLE ONLY public.news
    ADD CONSTRAINT fk_1dd39950f08acf73 FOREIGN KEY (news_user_id) REFERENCES public."user"(id);
 B   ALTER TABLE ONLY public.news DROP CONSTRAINT fk_1dd39950f08acf73;
       public          postgres    false    2024    187    189            �           2606    123031    comments fk_5f9e962aaaa72059    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_5f9e962aaaa72059 FOREIGN KEY (comments_user_id) REFERENCES public."user"(id);
 F   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_5f9e962aaaa72059;
       public          postgres    false    187    2024    191            �           2606    123037    comments fk_5f9e962ab86daa6c    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_5f9e962ab86daa6c FOREIGN KEY (comments_news_id) REFERENCES public.news(id);
 F   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_5f9e962ab86daa6c;
       public          postgres    false    2027    191    189            n   e   x�3⼰����.6^lR���¾{�p녽�.l��paǅ��&�&\��[.v_�D�9�8͸�L9�S�@�7�22á^�Ql�	�
�n����� �*N�      i   h   x�e��	�@��*l@�<vܛZ��讁C���?�sW��-S]�&�0�&�nU�X������"�iq|���oR;�x�{�3a��D��=.o      l   �   x���A�0E��)zL[�g�0b�a�	t�		I�+����B�,L�tڼ7�{ ���n��k�h�.'Wd�ձ�b�*c\j�-hFf���D���F9၎K>c
�U���?��i��*���J�U��RW�
e� ?6�%�zn�7?��=!	��~?�G����k�D��i�C���s�_�D�wQ} c��}      j   �  x����r�@ @�5|F�)AhV��($�����������|}j��]��]�+PhV����)-Q�g)�_�~���kӰ�PjSR	y����)W�$��c���j�Hf�
{�+w�`�����G�T��v�s�-uw��n�Tx��Y]� |em����C�T�%�[��8�ҼK���r�dsF�I}�	�{�r(�2�Q�� ��6�.�霭Ŀ�Z���zG�q�M��4�P�W�� ��ڋr����',���I56�__Ƒ�w�v��\�CUD�ڭe�R9&-Q�_��#YHX��(�J�tyo����>S^J�ѫ4��2�ٰ0�]sl�a�F�8%����)?}��e��i��2�b|*�U� e*��~l�C���M0U�2_��tʢ��M ���=�i��2ŧ     