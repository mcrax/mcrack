.class public Lcom/googleplay/licensing/ServerManagedPolicy;
.super Ljava/lang/Object;
.source "ServerManagedPolicy.java"

# interfaces
.implements Lcom/googleplay/licensing/Policy;


# static fields
.field private static final DEFAULT_MAX_RETRIES:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_COUNT:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_UNTIL:Ljava/lang/String; = "0"

.field private static final DEFAULT_VALIDITY_TIMESTAMP:Ljava/lang/String; = "0"

.field private static final MILLIS_PER_MINUTE:J = 0xea60L

.field private static final PREFS_FILE:Ljava/lang/String; = "com.android.vending.licensing.ServerManagedPolicy"

.field private static final PREF_LAST_RESPONSE:Ljava/lang/String; = "lastResponse"

.field private static final PREF_MAX_RETRIES:Ljava/lang/String; = "maxRetries"

.field private static final PREF_RETRY_COUNT:Ljava/lang/String; = "retryCount"

.field private static final PREF_RETRY_UNTIL:Ljava/lang/String; = "retryUntil"

.field private static final PREF_VALIDITY_TIMESTAMP:Ljava/lang/String; = "validityTimestamp"

.field private static final TAG:Ljava/lang/String; = "ServerManagedPolicy"

.field private static isServerResponse:Z


# instance fields
.field private mLastResponse:I

.field private mLastResponseTime:J

.field private mMaxRetries:J

.field private mOriginalGT:J

.field private mOriginalRetries:J

.field private mOriginalVT:J

.field private mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

.field private mRetryCount:J

.field private mRetryUntil:J

.field private mValidityTimestamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    sput-boolean v0, Lcom/googleplay/licensing/ServerManagedPolicy;->isServerResponse:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/googleplay/licensing/Obfuscator;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "obfuscator"    # Lcom/googleplay/licensing/Obfuscator;

    .prologue
    const-wide/16 v4, 0x0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-wide/32 v2, 0xea60

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalVT:J

    .line 65
    iput-wide v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalGT:J

    .line 66
    iput-wide v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalRetries:J

    .line 72
    iput-wide v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponseTime:J

    .line 82
    const-string v1, "com.android.vending.licensing.ServerManagedPolicy"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 83
    .local v0, "sp":Landroid/content/SharedPreferences;
    new-instance v1, Lcom/googleplay/licensing/PreferenceObfuscator;

    invoke-direct {v1, v0, p2}, Lcom/googleplay/licensing/PreferenceObfuscator;-><init>(Landroid/content/SharedPreferences;Lcom/googleplay/licensing/Obfuscator;)V

    iput-object v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    .line 84
    iget-object v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v2, "lastResponse"

    const/16 v3, 0x123

    .line 85
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/googleplay/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 84
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponse:I

    .line 86
    iget-object v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v2, "validityTimestamp"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/googleplay/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    .line 88
    iget-object v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v2, "retryUntil"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/googleplay/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryUntil:J

    .line 89
    iget-object v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v2, "maxRetries"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/googleplay/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mMaxRetries:J

    .line 90
    iget-object v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v2, "retryCount"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/googleplay/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryCount:J

    .line 91
    return-void
.end method

.method private decodeExtras(Ljava/lang/String;)Ljava/util/Map;
    .locals 8
    .param p1, "extras"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 290
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 292
    .local v4, "results":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v3, Ljava/net/URI;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 293
    .local v3, "rawExtras":Ljava/net/URI;
    const-string v5, "UTF-8"

    invoke-static {v3, v5}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 294
    .local v1, "extraList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/NameValuePair;

    .line 295
    .local v2, "item":Lorg/apache/http/NameValuePair;
    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 297
    .end local v1    # "extraList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v2    # "item":Lorg/apache/http/NameValuePair;
    .end local v3    # "rawExtras":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 298
    .local v0, "e":Ljava/net/URISyntaxException;
    const-string v5, "ServerManagedPolicy"

    const-string v6, "Invalid syntax error while decoding extras data from server."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    .end local v0    # "e":Ljava/net/URISyntaxException;
    :cond_0
    return-object v4
.end method

.method private setLastResponse(I)V
    .locals 3
    .param p1, "l"    # I

    .prologue
    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponseTime:J

    .line 145
    iput p1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponse:I

    .line 146
    iget-object v0, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v1, "lastResponse"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/googleplay/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    return-void
.end method

.method private setMaxRetries(Ljava/lang/String;)V
    .locals 6
    .param p1, "maxRetries"    # Ljava/lang/String;

    .prologue
    .line 235
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 236
    .local v1, "lMaxRetries":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalRetries:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    :goto_0
    const-string v2, "ServerManagedPolicy"

    const-string v3, "license check retries = %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mMaxRetries:J

    .line 247
    iget-object v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v3, "maxRetries"

    invoke-virtual {v2, v3, p1}, Lcom/googleplay/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    return-void

    .line 237
    .end local v1    # "lMaxRetries":Ljava/lang/Long;
    :catch_0
    move-exception v0

    .line 239
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "ServerManagedPolicy"

    const-string v3, "Licence retry count (GR) missing, grace period disabled"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    const-string p1, "0"

    .line 241
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .restart local v1    # "lMaxRetries":Ljava/lang/Long;
    goto :goto_0
.end method

.method private setRetryCount(J)V
    .locals 3
    .param p1, "c"    # J

    .prologue
    .line 156
    iput-wide p1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryCount:J

    .line 157
    iget-object v0, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v1, "retryCount"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/googleplay/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    return-void
.end method

.method private setRetryUntil(Ljava/lang/String;)V
    .locals 6
    .param p1, "retryUntil"    # Ljava/lang/String;

    .prologue
    .line 206
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 207
    .local v1, "lRetryUntil":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalGT:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    :goto_0
    const-string v2, "ServerManagedPolicy"

    const-string v3, "license retry until timestamp = %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryUntil:J

    .line 218
    iget-object v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v3, "retryUntil"

    invoke-virtual {v2, v3, p1}, Lcom/googleplay/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    return-void

    .line 208
    .end local v1    # "lRetryUntil":Ljava/lang/Long;
    :catch_0
    move-exception v0

    .line 210
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "ServerManagedPolicy"

    const-string v3, "License retry timestamp (GT) missing, grace period disabled"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    const-string p1, "0"

    .line 212
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .restart local v1    # "lRetryUntil":Ljava/lang/Long;
    goto :goto_0
.end method

.method private setValidityTimestamp(Ljava/lang/String;)V
    .locals 6
    .param p1, "validityTimestamp"    # Ljava/lang/String;

    .prologue
    .line 174
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 175
    .local v1, "lValidityTimestamp":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalVT:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    .line 185
    iget-object v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    const-string v3, "validityTimestamp"

    invoke-virtual {v2, v3, p1}, Lcom/googleplay/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    return-void

    .line 177
    .end local v1    # "lValidityTimestamp":Ljava/lang/Long;
    :catch_0
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "ServerManagedPolicy"

    const-string v3, "License validity timestamp (VT) missing, caching for a minute"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0xea60

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 181
    .restart local v1    # "lValidityTimestamp":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method


# virtual methods
.method public allowAccess()Z
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x1

    .line 265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 266
    .local v0, "ts":J
    iget v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponse:I

    const/16 v5, 0x100

    if-ne v4, v5, :cond_2

    .line 268
    iget-wide v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    cmp-long v4, v0, v4

    if-gtz v4, :cond_0

    .line 270
    sget-boolean v2, Lcom/googleplay/licensing/ServerManagedPolicy;->isServerResponse:Z

    if-eqz v2, :cond_1

    .line 271
    const-string v2, "ServerManagedPolicy"

    const-string v4, "Server license response"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    move v2, v3

    .line 286
    :cond_0
    :goto_1
    return v2

    .line 274
    :cond_1
    const-string v2, "ServerManagedPolicy"

    const-string v4, "Cached license response"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 280
    :cond_2
    iget v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponse:I

    const/16 v5, 0x123

    if-ne v4, v5, :cond_0

    iget-wide v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponseTime:J

    const-wide/32 v6, 0xea60

    add-long/2addr v4, v6

    cmp-long v4, v0, v4

    if-gez v4, :cond_0

    .line 284
    iget-wide v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryUntil:J

    cmp-long v4, v0, v4

    if-lez v4, :cond_3

    iget-wide v4, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryCount:J

    iget-wide v6, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mMaxRetries:J

    cmp-long v4, v4, v6

    if-gtz v4, :cond_0

    :cond_3
    move v2, v3

    goto :goto_1
.end method

.method public getExtraLicenseData()[J
    .locals 4

    .prologue
    .line 193
    const/4 v0, 0x3

    new-array v0, v0, [J

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalVT:J

    aput-wide v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalGT:J

    aput-wide v2, v0, v1

    const/4 v1, 0x2

    iget-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mOriginalRetries:J

    aput-wide v2, v0, v1

    return-object v0
.end method

.method public getMaxRetries()J
    .locals 2

    .prologue
    .line 251
    iget-wide v0, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mMaxRetries:J

    return-wide v0
.end method

.method public getRetryCount()J
    .locals 2

    .prologue
    .line 161
    iget-wide v0, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryCount:J

    return-wide v0
.end method

.method public getRetryUntil()J
    .locals 2

    .prologue
    .line 222
    iget-wide v0, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryUntil:J

    return-wide v0
.end method

.method public getValidityTimestamp()J
    .locals 2

    .prologue
    .line 189
    iget-wide v0, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    return-wide v0
.end method

.method public processServerResponse(ILcom/googleplay/licensing/ResponseData;)V
    .locals 6
    .param p1, "response"    # I
    .param p2, "rawData"    # Lcom/googleplay/licensing/ResponseData;

    .prologue
    .line 109
    const/4 v1, 0x1

    sput-boolean v1, Lcom/googleplay/licensing/ServerManagedPolicy;->isServerResponse:Z

    .line 112
    const/16 v1, 0x123

    if-eq p1, v1, :cond_1

    .line 113
    const-wide/16 v2, 0x0

    invoke-direct {p0, v2, v3}, Lcom/googleplay/licensing/ServerManagedPolicy;->setRetryCount(J)V

    .line 118
    :goto_0
    const/16 v1, 0x100

    if-ne p1, v1, :cond_2

    .line 120
    iget-object v1, p2, Lcom/googleplay/licensing/ResponseData;->extra:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/googleplay/licensing/ServerManagedPolicy;->decodeExtras(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 121
    .local v0, "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput p1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mLastResponse:I

    .line 122
    const-string v1, "VT"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/googleplay/licensing/ServerManagedPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    .line 123
    const-string v1, "GT"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/googleplay/licensing/ServerManagedPolicy;->setRetryUntil(Ljava/lang/String;)V

    .line 124
    const-string v1, "GR"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/googleplay/licensing/ServerManagedPolicy;->setMaxRetries(Ljava/lang/String;)V

    .line 132
    .end local v0    # "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    :goto_1
    invoke-direct {p0, p1}, Lcom/googleplay/licensing/ServerManagedPolicy;->setLastResponse(I)V

    .line 133
    iget-object v1, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mPreferences:Lcom/googleplay/licensing/PreferenceObfuscator;

    invoke-virtual {v1}, Lcom/googleplay/licensing/PreferenceObfuscator;->commit()V

    .line 134
    return-void

    .line 115
    :cond_1
    iget-wide v2, p0, Lcom/googleplay/licensing/ServerManagedPolicy;->mRetryCount:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-direct {p0, v2, v3}, Lcom/googleplay/licensing/ServerManagedPolicy;->setRetryCount(J)V

    goto :goto_0

    .line 125
    :cond_2
    const/16 v1, 0x231

    if-ne p1, v1, :cond_0

    .line 127
    const-string v1, "0"

    invoke-direct {p0, v1}, Lcom/googleplay/licensing/ServerManagedPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    .line 128
    const-string v1, "0"

    invoke-direct {p0, v1}, Lcom/googleplay/licensing/ServerManagedPolicy;->setRetryUntil(Ljava/lang/String;)V

    .line 129
    const-string v1, "0"

    invoke-direct {p0, v1}, Lcom/googleplay/licensing/ServerManagedPolicy;->setMaxRetries(Ljava/lang/String;)V

    goto :goto_1
.end method
