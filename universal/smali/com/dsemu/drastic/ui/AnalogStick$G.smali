.class final Lcom/dsemu/drastic/ui/AnalogStick$G;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnTouchListener;
.source "AnalogStick.java"


# instance fields
.field final g:Lcom/dsemu/drastic/DraSticGlView;


# direct methods
.method constructor <init>(Lcom/dsemu/drastic/DraSticGlView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dsemu/drastic/ui/AnalogStick$G;->g:Lcom/dsemu/drastic/DraSticGlView;

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick$G;->g:Lcom/dsemu/drastic/DraSticGlView;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Lcom/dsemu/drastic/DraSticGlView;->y0(Landroid/view/MotionEvent;Z)Z

    const-wide/16 v1, 0x5

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method
