from locust import HttpUser, TaskSet, task, between


test: dict = {
    "gender": "Female",
    "age": 80,
    "city": "TEST",
    "cgpa": 7,
    "degree": "B.Arch",
    "profession": "Architect",
    "profession_hour_daily": 5,
    "profession_pressure": 5,
    "profession_satisfaction": 5,
    "financial_stress": 5,
    "sleep_duration": "Less than 5 hours",
    "dietary_habits": "Unhealthy",
    "history_family_illness_mental": True,
    "history_thoughts_suicidal": True }


class DepressionPredict(TaskSet):
    @task
    def predict(self):
        request_body = test
        self.client.post(
            '/predict',
            json = request_body )


class DepressionLoadTest(HttpUser):
    tasks = [DepressionPredict]
    host = "http://localhost:8000"
    stop_timeout = 20
    wait_time = between(1, 5)