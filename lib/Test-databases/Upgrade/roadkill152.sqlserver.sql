CREATE TABLE [dbo].[roadkill_users](
	[Id] [uniqueidentifier] NOT NULL,
	[ActivationKey] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Firstname] [nvarchar](255) NULL,
	[IsEditor] [bit] NULL,
	[IsAdmin] [bit] NULL,
	[IsActivated] [bit] NULL,
	[Lastname] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[PasswordResetKey] [nvarchar](255) NULL,
	[Salt] [nvarchar](255) NULL,
	[Username] [nvarchar](255) NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC)
)
CREATE NONCLUSTERED INDEX [email] ON [dbo].[roadkill_users] ([Email] ASC);

INSERT [dbo].[roadkill_users] ([Id], [ActivationKey], [Email], [Firstname], [IsEditor], [IsAdmin], [IsActivated], [Lastname], [Password], [PasswordResetKey], [Salt], [Username]) VALUES (N'6bd8d7d2-015b-4a9c-a24a-a19d015c162b', NULL, N'admin@localhost', NULL, 0, 1, 1, NULL, N'986A6784513DAB546B30AAC8122992CB5F36E348', NULL, N'wo?4.=IQRj=U74p!', N'admin');

CREATE TABLE [dbo].[roadkill_siteconfiguration](
	[Id] [uniqueidentifier] NOT NULL,
	[AllowedFileTypes] [nvarchar](255) NULL,
	[AllowUserSignup] [bit] NULL,
	[EnableRecaptcha] [bit] NULL,
	[MarkupType] [nvarchar](255) NULL,
	[RecaptchaPrivateKey] [nvarchar](255) NULL,
	[RecaptchaPublicKey] [nvarchar](255) NULL,
	[SiteUrl] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Theme] [nvarchar](255) NULL,
	[Version] [nvarchar](255) NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC)
);

INSERT [dbo].[roadkill_siteconfiguration] ([Id], [AllowedFileTypes], [AllowUserSignup], [EnableRecaptcha], [MarkupType], [RecaptchaPrivateKey], [RecaptchaPublicKey], [SiteUrl], [Title], [Theme], [Version]) VALUES (N'b960e8e5-529f-4f7c-aee4-28eb23e13dbd', N'jpg,png,gif,zip,xml,pdf', 0, 0, N'Creole', NULL, NULL, N'http://roadkill152.local', N'152', N'Mediawiki', N'1.5.2.0');

CREATE TABLE [dbo].[roadkill_pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Tags] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[IsLocked] [bit] NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[ModifiedOn] [datetime] NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC)
);

INSERT [dbo].[roadkill_pages] ([Title], [Tags], [CreatedBy], [CreatedOn], [IsLocked], [ModifiedBy], [ModifiedOn]) VALUES (N'homepage', N'homepage', N'admin', CAST(0x0000A19D015C3AE0 AS DateTime), 0, N'admin', CAST(0x0000A19D015C3AE0 AS DateTime));

CREATE TABLE [dbo].[roadkill_pagecontent](
	[Id] [uniqueidentifier] NOT NULL,
	[EditedBy] [nvarchar](255) NULL,
	[EditedOn] [datetime] NULL,
	[VersionNumber] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[pageid] [int] NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE NONCLUSTERED INDEX [pageId] ON [dbo].[roadkill_pagecontent] 
(
	[pageid] ASC
);

INSERT [dbo].[roadkill_pagecontent] ([Id], [EditedBy], [EditedOn], [VersionNumber], [Text], [pageid]) VALUES (N'6a365852-a23b-4e86-81d1-a19d015c3b3d', N'admin', CAST(0x0000A19D015C3AE0 AS DateTime), 1, N'This is 1.5.2 homepage', 1);
ALTER TABLE [dbo].[roadkill_pagecontent]  WITH CHECK ADD  CONSTRAINT [FKCB655B1F6C100623] FOREIGN KEY([pageid]) REFERENCES [dbo].[roadkill_pages] ([Id]);
ALTER TABLE [dbo].[roadkill_pagecontent] CHECK CONSTRAINT [FKCB655B1F6C100623];