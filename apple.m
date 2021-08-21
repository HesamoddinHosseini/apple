close all
clear all
clc
pic=imread('image2.jpeg');
subplot(2,4,1),imshow(pic);
title('original');
pic_gray=rgb2gray(pic);
subplot(2,4,2),imshow(pic_gray);
title('gray');
imtool(pic)
pic_edge=edge(pic_gray,'canny',.1);
subplot(2,4,3),imshow(pic_edge);
se=strel('disk',10);
pic_dilate1=imdilate(pic_edge,se);
subplot(2,4,4),imshow(pic_dilate1);
pic_dilate2=imdilate(pic_dilate1,se);
pic_fill=imfill(pic_dilate2,'holes');
subplot(2,4,5),imshow(pic_fill);
bw=bwlabel(pic_fill);
bond=regionprops(bw,'BoundingBox');
    b=bond(1);
    ii=b.BoundingBox(1);
    jj=b.BoundingBox(2);
    kk=b.BoundingBox(3);
    ll=b.BoundingBox(4);
p1=imcrop(pic,[ii jj kk ll]);
%subplot(2,4,6),imshow(p1);
    b=bond(2);
    ii=b.BoundingBox(1);
    jj=b.BoundingBox(2);
    kk=b.BoundingBox(3);
    ll=b.BoundingBox(4);
p2=imcrop(pic,[ii jj kk ll]);
subplot(2,4,7),imshow(p2);
    b=bond(3);
    ii=b.BoundingBox(1);
    jj=b.BoundingBox(2);
    kk=b.BoundingBox(3);
    ll=b.BoundingBox(4);
p3=imcrop(pic,[ii jj kk ll]);
subplot(2,4,8),imshow(p3);

mean0=mean2(p1);
mean1=mean2(p2);
mean3=mean2(p3);

subplot(2,4,6),imshow(p1);
if 180<mean0 && mean0<190
    title('green');
elseif mean0>190
      title('yellow');
    else
       title('red');
end
subplot(2,4,7),imshow(p2);
if 180<mean1 && mean1<190
    title('green');
elseif mean1>190
      title('yellow');
    else
       title('red');
end

subplot(2,4,8),imshow(p3);
if 180<mean3 && mean3<190
    title('green');
elseif mean3>190
      title('yellow');
    else
       title('red');
end
    