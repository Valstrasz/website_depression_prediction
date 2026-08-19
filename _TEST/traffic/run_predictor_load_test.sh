#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

locust -f "${SCRIPT_DIR}/predictor_load_test.py"