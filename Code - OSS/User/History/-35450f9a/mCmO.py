import cv2
import numpy as np
from tensorflow.keras.models import load_model
import imutils

img = cv2.imread('./SudokuSS/10.jpeg')




def find_board(img):
    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    bfilter = cv2.bilateralFilter(gray,13,20,20)
    edged = cv2.Canny(bfilter,30,100)
    keypoints = cv2.findContours(edged.copy(),cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
    countours = imutils.grab_contours(keypoints)
    newimg = cv2.drawContours(img.copy(),countours,-1,(0,255,0),3)
    
    
    countours = sorted(countours,key=cv2.contourArea,reverse=True)[:15]
    location = None

    for c in countours:
        approx = cv2.approxPolyDP(c,15,True)
        if len(approx) == 4:
            location = approx
            
        print(len(approx))

    result = get_persp(img,location)
        
   
    return result,location


def get_persp(img,location,height=900,width=900):
    pts1 = np.float32([location[0],location[3],location[1],location[2]])
    pts2 = np.float32([[0,0],[width,0],[0,height],[width,height]])


    matrix = cv2.getPerspectiveTransform(pts1,pts2)
    result = cv2.warpPerspective(img,matrix,(width,height))
    return result



board,location = find_board(img)
cv2.imshow("spliteed",board)
cv2.waitKey(1000)

def split_boxes(board):
    rows = np.vsplit(board,9)
    boxes = []

    for r in rows:
        cols = np.hsplit(r,9)

        for box in cols:
            box = cv2.resize(box, (48, 48))
            cv2.imshow("spliteed",box)
            cv2.waitKey(1000)
            boxes.append(box)
    return boxes

gray = cv2.cvtColor(board, cv2.COLOR_BGR2GRAY)
rois = split_boxes(gray)
rois = np.array(rois)
classes = np.arange(0, 10)
model = load_model('./model-OCR.h5')
prediction = model.predict(rois)
predicted_numbers = []
# get classes from prediction
for i in prediction:
    index = np.argmax(i)
    predicted_number = classes[int(index)]
    predicted_numbers.append(predicted_number)
print(predicted_numbers)
# reshape the list
board_num = np.array(predicted_numbers).astype('uint8').reshape(9, 9)
print(board_num)
