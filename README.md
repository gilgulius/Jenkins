# Jenkins
jenkins file: שלבים: 1.הגדרת agent 2.הגדרת פרמטרים:Message-ברירת המחדל היא "Hello from Jenkins!", וניתן לשנות את הערך הזה בזמן ההרצה של הפייפליין. 3.שלבים- שלב ראשון-Clone repository:בשלב זה, הפייפליין שולף את הקוד מהמאגר GitHub. הוא בודק את הbranch בשם main ומביא את הקוד מהכתובת שניתנה

שלב שני-Run PowerShell Script-בשלב זה הפייפליין מריץ את הסקריפט בPowerShell שנמצא בקובץ script.ps1. הוא מעביר את הפרמטר MESSAGE מהפייפליין לסקריפט, כך שהסקריפט יכול להשתמש בהודעה שהמשתמש מספק

שלב שלישי-Publish HTML Report-בשלב זה הפייפליין מפרסם את הדו"ח שנוצר על ידי הסקריפט כקובץ HTML הדו"ח שנוצר (output.html) יפורסם דרך ה-Plugin של publishHTML הפרמטרים המוגדרים כאן מבטיחים שהדו"ח יישאר בהיסטוריית הבניה, ושהקובץ יישמר ויוצג תמיד

Script.ps1:

הגדרת פרמטר:הקוד מתחיל בהגדרת פרמטר $Message שהוא מחרוזת. ברירת המחדל היא "Hello from Jenkins!", אך אפשר לשנות את הערך הזה כאשר מריצים את הסקריפט 2.קבלת חותמת זמן:השורה הזו אוספת את החותמת הזמן הנוכחית ומבנה אותה לפי הפורמט "yyyy-MM-dd HH:mm:ss", כך שההודעה תכיל את הזמן המדויק שבו נוצר הדוח 3.יצירת קובץ HTML:כאן נבנה התוכן של הדוח כקובץ HTML עם עיצוב מותאם אישית. השימוש ב-@"" מאפשר ליצור בלוק מולטשורת עיצוב: יש שימוש ב-CSS כדי לעצב את הדף, כולל סגנונות עבור כותרת, טקסט ומסגרת עם צל (shadow) בתוך התוכן, מופיעה ההודעה שהוזנה (או ברירת המחדל) ואת חותמת הזמן שנלקחה קודם
4.שמירת קובץ הHTML:התוכן שנוצר נשמר לקובץ בשם output.html בספרייה הנוכחית, בפורמט UTF-8. 5.הדפסת מיקום הקובץ:בסוף הקוד מדפיס את מיקום הקובץ שנוצר בצורה נוחה כדי שתוכל לגשת אליו. הוא מציג את כתובת ה-URL של הקובץ.

מטרת הקוד:קבלת הודעה מעוצבת או הודעת ברירת מחדל עם חתימת זמן עדכני