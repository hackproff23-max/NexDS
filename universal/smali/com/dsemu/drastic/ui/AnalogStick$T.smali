.class final Lcom/dsemu/drastic/ui/AnalogStick$T;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "AnalogStick.java"


# instance fields
.field final c:I

.field final s:Lcom/dsemu/drastic/ui/AnalogStick;


# direct methods
.method constructor <init>(Lcom/dsemu/drastic/ui/AnalogStick;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dsemu/drastic/ui/AnalogStick$T;->s:Lcom/dsemu/drastic/ui/AnalogStick;

    iput p2, p0, Lcom/dsemu/drastic/ui/AnalogStick$T;->c:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick$T;->s:Lcom/dsemu/drastic/ui/AnalogStick;

    iget v1, p0, Lcom/dsemu/drastic/ui/AnalogStick$T;->c:I

    invoke-virtual {v0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->tick(I)V

    return-void
.end method
