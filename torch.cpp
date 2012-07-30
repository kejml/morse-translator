#include "torch.h"
#include <gst/gst.h>
#include <QDebug>

torch::torch(QObject *parent) :
    QObject(parent), src(0), mStatus(false)
{
    //gst-launch-0.10 subdevsrc video-torch=1 viewfinder-mode=1 ! fakesink

    gst_init(NULL, NULL);
    src = gst_element_factory_make("subdevsrc", "src");

    if (!src)
        return;

    g_object_set(G_OBJECT(src), "video-torch", 1, NULL);
    g_object_set(G_OBJECT(src), "viewfinder-mode", 1, NULL);
    gst_element_set_state(src, GST_STATE_NULL);
}

void torch::start(){
    qDebug() << "START";
    gst_element_set_state(src, GST_STATE_PLAYING);
}

void torch::stop(){
    qDebug() << "STOP";
    gst_element_set_state(src, GST_STATE_NULL);
}

void torch::toggle(){
    qDebug() << "TOGGLE";
    setStatus(!mStatus);
}

bool torch::status(){
    qDebug() << "STATUS";
    return mStatus;
}

void torch::setStatus(bool on){
    qDebug() << "SET STATUS" << on;
    if (on){
        emit statusChanged(true);
        start();
    } else {
        emit statusChanged(false);
        stop();
    }

    mStatus = on;
}
