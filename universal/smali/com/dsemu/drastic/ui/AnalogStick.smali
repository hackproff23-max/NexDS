.class public Lcom/dsemu/drastic/ui/AnalogStick;
.super Landroid/view/View;
.source "AnalogStick.java"

# instance fields
.field private alpha:I

.field private bmpBase:Landroid/graphics/Bitmap;

.field private bmpKnob:Landroid/graphics/Bitmap;

.field private curX:F

.field private curY:F

.field private inDead:Z

.field private kind:I

.field private looping:Z

.field private penDown:Z

.field private rHold:Ljava/lang/Runnable;

.field private rLoop:Ljava/lang/Runnable;

.field private rTap:Ljava/lang/Runnable;

.field private rect:Landroid/graphics/RectF;

.field private vx:F

.field private vy:F

.field private cx:F

.field private cy:F

.field private dens:F

.field private edit:Z

.field private enabled:Z

.field private gl:Lcom/dsemu/drastic/DraSticGlView;

.field private kx:F

.field private ky:F

.field private land:Z

.field private mask:I

.field private mode:I

.field private moved:Z

.field private pFill:Landroid/graphics/Paint;

.field private pText:Landroid/graphics/Paint;

.field private pid:I

.field private prefs:Landroid/content/SharedPreferences;

.field private scx:F

.field private scy:F

.field private sx:F

.field private sy:F

.field private sz:F

# direct methods

.method public static attachEdit(Landroid/app/Activity;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->add(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;ZI)V

    invoke-static {p0, v0, v1, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->add(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;ZI)V

    return-void
.end method

.method public static attachGame(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->add(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;ZI)V

    invoke-static {p0, p1, v0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->add(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;ZI)V

    return-void
.end method

.method private applyMask(I)V
    .locals 2

    const/4 v0, 0x1

    const/16 v1, 0xc

    invoke-direct {p0, p1, v0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setBit(III)V

    const/4 v0, 0x2

    const/16 v1, 0xd

    invoke-direct {p0, p1, v0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setBit(III)V

    const/4 v0, 0x4

    const/16 v1, 0xe

    invoke-direct {p0, p1, v0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setBit(III)V

    const/16 v0, 0x8

    const/16 v1, 0xf

    invoke-direct {p0, p1, v0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setBit(III)V

    iput p1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mask:I

    return-void
.end method

.method private ccx()F
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    mul-float/2addr v0, v1

    return v0
.end method

.method private ccy()F
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    mul-float/2addr v0, v1

    return v0
.end method

.method private rad()F
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sz:F

    mul-float/2addr v0, v1

    return v0
.end method

.method private clamp()V
    .locals 8

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v0, :cond_0

    if-gtz v1, :cond_1

    :cond_0
    return-void

    :cond_1
    int-to-float v2, v0

    int-to-float v3, v1

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->rad()F

    move-result v4

    div-float v5, v4, v2

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float v7, v6, v5

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    invoke-static {v7, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    div-float v5, v4, v3

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float v7, v6, v5

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    invoke-static {v7, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iput v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    return-void
.end method

.method private inside(FF)Z
    .locals 6

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccx()F

    move-result v0

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccy()F

    move-result v1

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->rad()F

    move-result v2

    sub-float v3, p1, v0

    sub-float v4, p2, v1

    mul-float/2addr v3, v3

    mul-float/2addr v4, v4

    add-float/2addr v3, v4

    const v4, 0x3f99999a    # 1.2f

    mul-float/2addr v4, v2

    mul-float/2addr v4, v4

    cmpg-float v5, v3, v4

    if-gtz v5, :cond_0

    const/4 v5, 0x1

    return v5

    :cond_0
    const/4 v5, 0x0

    return v5
.end method

.method private key(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->land:Z

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kind:I

    if-eqz v1, :cond_k0

    if-eqz v0, :cond_q

    const-string v0, "M"

    goto :goto_0

    :cond_q
    const-string v0, "Q"

    goto :goto_0

    :cond_k0
    if-eqz v0, :cond_p

    const-string v0, "L"

    goto :goto_0

    :cond_p
    const-string v0, "P"

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private load()V
    .locals 4

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "x"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v2

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    const-string v1, "y"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v2

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    const-string v1, "s"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sz:F

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v2

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sz:F

    const-string v1, "a"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->alpha:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->alpha:I

    const-string v1, "e"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    return-void
.end method

.method private release()V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->applyMask(I)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kx:F

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->ky:F

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vx:F

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vy:F

    iput-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->inDead:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pid:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method private save()V
    .locals 4

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "x"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    const-string v1, "y"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    const-string v1, "s"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sz:F

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    const-string v1, "a"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->alpha:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string v1, "e"

    invoke-direct {p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private setBit(III)V
    .locals 3

    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mask:I

    xor-int/2addr v0, p1

    and-int/2addr v0, p2

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->gl:Lcom/dsemu/drastic/DraSticGlView;

    if-eqz v1, :cond_2

    and-int v0, p1, p2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, p3, v0}, Lcom/dsemu/drastic/DraSticGlView;->w0(IZ)V

    :cond_2
    return-void
.end method

.method private touchEdit(Landroid/view/MotionEvent;I)Z
    .locals 12

    if-eqz p2, :cond_down

    const/4 v0, 0x2

    if-eq p2, v0, :cond_move

    const/4 v0, 0x1

    if-eq p2, v0, :cond_up

    const/4 v0, 0x3

    if-eq p2, v0, :cond_up

    :cond_false
    const/4 v0, 0x0

    return v0

    :cond_true
    const/4 v0, 0x1

    return v0

    :cond_down
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccx()F

    move-result v2

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccy()F

    move-result v3

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->rad()F

    move-result v4

    const v5, 0x3f350481    # 0.7071f

    mul-float/2addr v5, v4

    add-float v6, v2, v5

    add-float v7, v3, v5

    sub-float v8, v0, v6

    sub-float v9, v1, v7

    mul-float/2addr v8, v8

    mul-float/2addr v9, v9

    add-float/2addr v8, v9

    const/high16 v9, 0x41e00000    # 28.0f

    iget v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v9, v10

    mul-float/2addr v9, v9

    cmpg-float v10, v8, v9

    if-gtz v10, :cond_noh

    const/4 v10, 0x2

    iput v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mode:I

    goto :goto_start

    :cond_noh
    invoke-direct {p0, v0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->inside(FF)Z

    move-result v10

    if-eqz v10, :cond_false

    const/4 v10, 0x1

    iput v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mode:I

    :goto_start
    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sx:F

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sy:F

    iget v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    iput v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->scx:F

    iget v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    iput v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->scy:F

    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->moved:Z

    goto :cond_true

    :cond_move
    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mode:I

    if-eqz v0, :cond_false

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    const/4 v3, 0x1

    if-ne v0, v3, :cond_resize

    iget v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sx:F

    sub-float v4, v1, v3

    iget v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sy:F

    sub-float v5, v2, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v7

    add-float/2addr v6, v7

    const/high16 v7, 0x41000000    # 8.0f

    iget v8, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v7, v8

    cmpl-float v6, v6, v7

    if-lez v6, :cond_nomv

    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->moved:Z

    :cond_nomv
    iget-boolean v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->moved:Z

    if-eqz v6, :cond_true

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v4, v6

    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->scx:F

    add-float/2addr v4, v7

    iput v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->scy:F

    add-float/2addr v5, v7

    iput v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->clamp()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :cond_true

    :cond_resize
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccx()F

    move-result v3

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccy()F

    move-result v4

    sub-float v5, v1, v3

    sub-float v6, v2, v4

    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sx:F

    sub-float v7, v1, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget v8, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sy:F

    sub-float v8, v2, v8

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    add-float/2addr v7, v8

    const/high16 v8, 0x41000000    # 8.0f

    iget v9, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v8, v9

    cmpl-float v7, v7, v8

    if-lez v7, :cond_nomv2

    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->moved:Z

    :cond_nomv2
    iget-boolean v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->moved:Z

    if-eqz v7, :cond_true

    mul-float/2addr v5, v5

    mul-float/2addr v6, v6

    add-float/2addr v5, v6

    float-to-double v8, v5

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    double-to-float v5, v8

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    const v6, 0x3da3d70a    # 0.08f

    const v7, 0x3ee66666    # 0.45f

    invoke-static {v7, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iput v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sz:F

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->clamp()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :cond_true

    :cond_up
    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mode:I

    if-eqz v0, :cond_false

    iget-boolean v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->moved:Z

    if-nez v1, :cond_save

    const/4 v2, 0x1

    if-ne v0, v2, :cond_cyc

    iget-boolean v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    goto :cond_save

    :cond_cyc
    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->alpha:I

    add-int/lit8 v1, v1, 0x32

    const/16 v2, 0xff

    if-le v1, v2, :cond_seta

    const/16 v1, 0x46

    :cond_seta
    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->alpha:I

    :cond_save
    const/4 v0, 0x0

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mode:I

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->save()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :cond_true
.end method

.method private touchGame(Landroid/view/MotionEvent;I)Z
    .locals 8

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pid:I

    if-eqz p2, :cond_down

    const/4 v2, 0x5

    if-eq p2, v2, :cond_down

    const/4 v2, 0x2

    if-eq p2, v2, :cond_move

    const/4 v2, 0x1

    if-eq p2, v2, :cond_up

    const/4 v2, 0x6

    if-eq p2, v2, :cond_pup

    const/4 v2, 0x3

    if-eq p2, v2, :cond_up

    :cond_false
    const/4 v0, 0x0

    return v0

    :cond_true
    const/4 v0, 0x1

    return v0

    :cond_down
    if-eqz v0, :cond_false

    const/4 v2, -0x1

    if-ne v1, v2, :cond_false

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/dsemu/drastic/ui/AnalogStick;->inside(FF)Z

    move-result v5

    if-eqz v5, :cond_false

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pid:I

    iget v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kind:I

    if-eqz v5, :cond_dn0

    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->inDead:Z

    iget-object v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rHold:Ljava/lang/Runnable;

    const-wide/16 v6, 0x12c

    invoke-virtual {p0, v5, v6, v7}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_dn0
    invoke-direct {p0, v3, v4}, Lcom/dsemu/drastic/ui/AnalogStick;->update(FF)V

    goto :cond_true

    :cond_move
    const/4 v2, -0x1

    if-eq v1, v2, :cond_false

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    if-ltz v2, :cond_true

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/dsemu/drastic/ui/AnalogStick;->update(FF)V

    goto :cond_true

    :cond_pup
    const/4 v2, -0x1

    if-eq v1, v2, :cond_false

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    if-ne v2, v1, :cond_false

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->endTouch()V

    goto :cond_true

    :cond_up
    const/4 v2, -0x1

    if-eq v1, v2, :cond_false

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->endTouch()V

    goto :cond_true
.end method

.method private update(FF)V
    .locals 14

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccx()F

    move-result v0

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccy()F

    move-result v1

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->rad()F

    move-result v2

    sub-float v3, p1, v0

    sub-float v4, p2, v1

    mul-float v5, v3, v3

    mul-float v6, v4, v4

    add-float/2addr v5, v6

    float-to-double v6, v5

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    double-to-float v5, v6

    const v6, 0x3f147ae1    # 0.58f

    mul-float/2addr v6, v2

    cmpl-float v7, v5, v6

    if-lez v7, :cond_in

    div-float v7, v6, v5

    mul-float v12, v3, v7

    mul-float v13, v4, v7

    goto :goto_k

    :cond_in
    move v12, v3

    move v13, v4

    :goto_k
    iput v12, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kx:F

    iput v13, p0, Lcom/dsemu/drastic/ui/AnalogStick;->ky:F

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kind:I

    if-eqz v6, :cond_k0

    invoke-direct {p0, v3, v4, v5, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->penStick(FFFF)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :cond_k0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const v6, 0x3e8f5c29    # 0.28f

    mul-float/2addr v6, v2

    cmpg-float v7, v5, v6

    if-ltz v7, :cond_apply

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v8

    const v9, 0x3ed41206    # 0.4142f

    mul-float v6, v8, v9

    cmpl-float v6, v7, v6

    if-lez v6, :cond_v

    cmpl-float v6, v3, v11

    if-lez v6, :cond_left

    or-int/lit8 v10, v10, 0x2

    goto :cond_v

    :cond_left
    or-int/lit8 v10, v10, 0x8

    :cond_v
    mul-float v6, v7, v9

    cmpl-float v6, v8, v6

    if-lez v6, :cond_apply

    cmpl-float v6, v4, v11

    if-lez v6, :cond_up

    or-int/lit8 v10, v10, 0x4

    goto :cond_apply

    :cond_up
    or-int/lit8 v10, v10, 0x1

    :cond_apply
    invoke-direct {p0, v10}, Lcom/dsemu/drastic/ui/AnalogStick;->applyMask(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->applyMask(I)V

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->penRelease()V

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    if-nez v0, :cond_go

    iget-boolean v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->edit:Z

    if-nez v1, :cond_go

    return-void

    :cond_go
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccx()F

    move-result v1

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ccy()F

    move-result v2

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->rad()F

    move-result v3

    iget v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->alpha:I

    if-nez v0, :cond_a

    const/16 v4, 0x46

    :cond_a
    iget-object v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pFill:Landroid/graphics/Paint;

    iget-object v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->bmpBase:Landroid/graphics/Bitmap;

    if-eqz v6, :cond_circ

    iget-object v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rect:Landroid/graphics/RectF;

    sub-float v8, v1, v3

    sub-float v9, v2, v3

    add-float v10, v1, v3

    add-float v11, v2, v3

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    const/4 v8, -0x1

    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    const/4 v8, 0x0

    invoke-virtual {p1, v6, v8, v7, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :cond_knob

    :cond_circ
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    div-int/lit8 v6, v4, 0x4

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p1, v1, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v6, 0x40400000    # 3.0f

    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v6, v7

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p1, v1, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_knob
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    const v8, 0x3ed70a3d    # 0.42f

    mul-float/2addr v8, v3

    iget v9, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kx:F

    add-float/2addr v9, v1

    iget v10, p0, Lcom/dsemu/drastic/ui/AnalogStick;->ky:F

    add-float/2addr v10, v2

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->bmpKnob:Landroid/graphics/Bitmap;

    if-eqz v6, :cond_kc

    iget-object v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rect:Landroid/graphics/RectF;

    sub-float v0, v9, v8

    sub-float v11, v10, v8

    add-float/2addr v9, v8

    add-float/2addr v10, v8

    invoke-virtual {v7, v0, v11, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    const/4 v8, 0x0

    invoke-virtual {p1, v6, v8, v7, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :cond_cur

    :cond_kc
    invoke-virtual {p1, v9, v10, v8, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_cur
    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kind:I

    if-eqz v6, :cond_nocur

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    const/4 v7, 0x0

    cmpl-float v6, v6, v7

    if-ltz v6, :cond_nocur

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-boolean v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->penDown:Z

    if-eqz v6, :cond_wc

    const v6, -0x10000

    goto :goto_sc

    :cond_wc
    const/4 v6, -0x1

    :goto_sc
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v6, 0xff

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    const/high16 v6, 0x40000000    # 2.0f

    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v6, v7

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v6, 0x41000000    # 8.0f

    mul-float/2addr v6, v7

    iget v8, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    iget v9, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    invoke-virtual {p1, v8, v9, v6, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_nocur
    iget-boolean v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->edit:Z

    if-eqz v6, :cond_end

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v6, 0x3f350481    # 0.7071f

    mul-float/2addr v6, v3

    add-float v8, v1, v6

    add-float v9, v2, v6

    const v6, -0x3ef9

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v6, 0xe6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    const/high16 v6, 0x41600000    # 14.0f

    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v6, v7

    invoke-virtual {p1, v8, v9, v6, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pText:Landroid/graphics/Paint;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    iget-boolean v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->enabled:Z

    iget v8, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kind:I

    if-eqz v7, :cond_off

    if-eqz v8, :cond_on0

    const-string v7, "CANETA"

    goto :goto_lbl

    :cond_on0
    const-string v7, "ANALOG 8"

    goto :goto_lbl

    :cond_off
    if-eqz v8, :cond_off0

    const-string v7, "CANETA (OFF) - toque p/ ativar"

    goto :goto_lbl

    :cond_off0
    const-string v7, "ANALOG 8 (OFF) - toque p/ ativar"

    :goto_lbl
    const/high16 v8, 0x40c00000    # 6.0f

    iget v9, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v8, v9

    sub-float v10, v2, v3

    sub-float/2addr v10, v8

    const/high16 v8, 0x41700000    # 15.0f

    mul-float/2addr v8, v9

    invoke-static {v10, v8}, Ljava/lang/Math;->max(FF)F

    move-result v10

    invoke-virtual {p1, v7, v1, v10, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_end
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 2

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    if-le p1, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->land:Z

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->load()V

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->clamp()V

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    iget-boolean v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->edit:Z

    if-eqz v1, :cond_0

    invoke-direct {p0, p1, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->touchEdit(Landroid/view/MotionEvent;I)Z

    move-result v0

    return v0

    :cond_0
    invoke-direct {p0, p1, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->touchGame(Landroid/view/MotionEvent;I)Z

    move-result v0

    return v0
.end method

.method private static add(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;ZI)V
    .locals 4

    :try_start_0
    new-instance v0, Lcom/dsemu/drastic/ui/AnalogStick;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/dsemu/drastic/ui/AnalogStick;-><init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;ZI)V

    const v1, 0x1020002

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;ZI)V
    .locals 5

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->gl:Lcom/dsemu/drastic/DraSticGlView;

    iput-boolean p3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->edit:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pid:I

    const v0, 0x3e4ccccd

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    const v0, 0x3f3851ec

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cy:F

    const v0, 0x3e4ccccd

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->sz:F

    const/16 v0, 0xaa

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->alpha:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pFill:Landroid/graphics/Paint;

    const/4 v2, 0x1

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    const/high16 v3, 0x41400000    # 12.0f

    mul-float/2addr v3, v0

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pText:Landroid/graphics/Paint;

    const-string v1, "nexds_analog"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->prefs:Landroid/content/SharedPreferences;

    iput p4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kind:I

    if-eqz p4, :cond_k0

    const v1, 0x3f4ccccd

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->cx:F

    :cond_k0
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rect:Landroid/graphics/RectF;

    new-instance v1, Lcom/dsemu/drastic/ui/AnalogStick$T;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/dsemu/drastic/ui/AnalogStick$T;-><init>(Lcom/dsemu/drastic/ui/AnalogStick;I)V

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rHold:Ljava/lang/Runnable;

    new-instance v1, Lcom/dsemu/drastic/ui/AnalogStick$T;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lcom/dsemu/drastic/ui/AnalogStick$T;-><init>(Lcom/dsemu/drastic/ui/AnalogStick;I)V

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rTap:Ljava/lang/Runnable;

    new-instance v1, Lcom/dsemu/drastic/ui/AnalogStick$T;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lcom/dsemu/drastic/ui/AnalogStick$T;-><init>(Lcom/dsemu/drastic/ui/AnalogStick;I)V

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rLoop:Ljava/lang/Runnable;

    if-eqz p4, :cond_n0

    const-string v1, "analog/pen_base.png"

    const-string v2, "analog/pen_knob.png"

    goto :goto_n

    :cond_n0
    const-string v1, "analog/analog_base.png"

    const-string v2, "analog/analog_knob.png"

    :goto_n
    invoke-direct {p0, p1, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->loadBmp(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->bmpBase:Landroid/graphics/Bitmap;

    invoke-direct {p0, p1, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->loadBmp(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->bmpKnob:Landroid/graphics/Bitmap;

    return-void
.end method

.method private loadBmp(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private penPress()V
    .locals 3

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->gl:Lcom/dsemu/drastic/DraSticGlView;

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    float-to-int v1, v1

    iget v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/dsemu/drastic/DraSticGlView;->penDown2(II)V

    :cond_0
    return-void
.end method

.method private penRelease()V
    .locals 2

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->penDown:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->penDown:Z

    iget-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->gl:Lcom/dsemu/drastic/DraSticGlView;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/dsemu/drastic/DraSticGlView;->penUp2()V

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void
.end method

.method private ensureCur()V
    .locals 4

    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_need

    return-void

    :cond_need
    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->gl:Lcom/dsemu/drastic/DraSticGlView;

    const/4 v2, 0x0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lcom/dsemu/drastic/DraSticGlView;->penCenter2()I

    move-result v2

    :cond_c
    if-eqz v2, :cond_fb

    ushr-int/lit8 v0, v2, 0x10

    int-to-float v0, v0

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    const v1, 0xffff

    and-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    return-void

    :cond_fb
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    iput v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    return-void
.end method

.method private loopStep()V
    .locals 10

    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pid:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_run

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->looping:Z

    return-void

    :cond_run
    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vx:F

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vy:F

    const/4 v2, 0x0

    cmpl-float v3, v0, v2

    if-nez v3, :cond_mv

    cmpl-float v3, v1, v2

    if-nez v3, :cond_mv

    iput-boolean v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->looping:Z

    return-void

    :cond_mv
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ensureCur()V

    const/high16 v2, 0x41200000    # 10.0f

    iget v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->dens:F

    mul-float/2addr v2, v3

    mul-float/2addr v0, v2

    mul-float/2addr v1, v2

    iget v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    iget v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    iget-object v9, p0, Lcom/dsemu/drastic/ui/AnalogStick;->gl:Lcom/dsemu/drastic/DraSticGlView;

    add-float v6, v4, v0

    if-eqz v9, :cond_ax

    float-to-int v7, v6

    float-to-int v8, v5

    invoke-virtual {v9, v7, v8}, Lcom/dsemu/drastic/DraSticGlView;->penIn2(II)Z

    move-result v7

    if-eqz v7, :cond_ay

    :cond_ax
    iput v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curX:F

    move v4, v6

    :cond_ay
    add-float v6, v5, v1

    if-eqz v9, :cond_bx

    float-to-int v7, v4

    float-to-int v8, v6

    invoke-virtual {v9, v7, v8}, Lcom/dsemu/drastic/DraSticGlView;->penIn2(II)Z

    move-result v7

    if-eqz v7, :cond_after

    :cond_bx
    iput v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->curY:F

    :cond_after
    iget-boolean v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->penDown:Z

    if-eqz v7, :cond_inv

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->penPress()V

    :cond_inv
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rLoop:Ljava/lang/Runnable;

    const-wide/16 v8, 0x10

    invoke-virtual {p0, v7, v8, v9}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private penStick(FFFF)V
    .locals 5

    const v0, 0x3e8f5c29    # 0.28f

    mul-float/2addr v0, p4

    cmpg-float v1, p3, v0

    if-gez v1, :cond_out

    const/4 v0, 0x0

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vx:F

    iput v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vy:F

    return-void

    :cond_out
    iget-boolean v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->inDead:Z

    if-eqz v1, :cond_nc

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->inDead:Z

    iget-object v1, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rHold:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_nc
    const v0, 0x3f147ae1    # 0.58f

    mul-float/2addr v0, p4

    const v1, 0x3e8f5c29    # 0.28f

    mul-float/2addr v1, p4

    sub-float v2, p3, v1

    sub-float v3, v0, v1

    div-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    div-float v3, p1, p3

    mul-float/2addr v3, v2

    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vx:F

    div-float v3, p2, p3

    mul-float/2addr v3, v2

    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->vy:F

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->looping:Z

    if-nez v0, :cond_done

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->looping:Z

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rLoop:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_done
    return-void
.end method

.method private endTouch()V
    .locals 3

    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->kind:I

    if-eqz v0, :cond_rel

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rHold:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->penDown:Z

    if-eqz v0, :cond_nh

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->penRelease()V

    goto :cond_rel

    :cond_nh
    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->inDead:Z

    if-eqz v0, :cond_rel

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ensureCur()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->penDown:Z

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->penPress()V

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->rTap:Ljava/lang/Runnable;

    const-wide/16 v1, 0x5a

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_rel
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->release()V

    return-void
.end method

.method public tick(I)V
    .locals 3

    const/4 v0, 0x1

    if-eq p1, v0, :cond_hold

    const/4 v0, 0x2

    if-eq p1, v0, :cond_tap

    const/4 v0, 0x3

    if-eq p1, v0, :cond_loop

    return-void

    :cond_hold
    iget v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->pid:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_ret

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->inDead:Z

    if-eqz v0, :cond_ret

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->ensureCur()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->penDown:Z

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->penPress()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_ret
    return-void

    :cond_tap
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->penRelease()V

    return-void

    :cond_loop
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->loopStep()V

    return-void
.end method
