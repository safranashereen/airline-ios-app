
# Flight Schedule Tracker iOS Application

How to:
1. Sign up with your email
2. Login with your email and password to see the airlines list
2. Click the Airline and view their schedules
3. Click the schedule to view the details flight details
4. In case if you forgot the password reset with email, you will receive reset link from firebase and set new password on it.

Limitations:
- for free plan API is limited to 1000 request/month, so if request is failed please get a new key and replace key in Config/beta.swift
- live data is null on the API for most of the cases, live data will be available if API returns only, (displaying the airport location is best option, but we cannot access v1/cities API for free plans
- v1/search API also not work for free plan)
- airline images are loading from a free API service which have less bandwidth


Referencers:

1. API Documentation: https://aviationstack.com/documentation

Developer Contact: shereensafrana@gmail.com
