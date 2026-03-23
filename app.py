cd /var/lib/jenkins/workspace/vammo

# Change port to 80
sed -i 's/port=5000/port=80/' app.py

# Push to GitHub
git config user.email "devops@vammo.com"
git config user.name "DevOps"
git add app.py
git commit -m "Fix: change Flask port to 80 for ECS"
git push origin main
