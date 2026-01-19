"""
cyberneon.nvim theme demo
This file demonstrates Python syntax highlighting
"""

import os
import sys
from typing import List, Dict, Optional, Tuple, Any
from dataclasses import dataclass
from datetime import datetime


# Constants
VERSION: str = "1.0.0"
MAX_RETRIES: int = 3
DEFAULT_TIMEOUT: float = 5.0


@dataclass
class Config:
    """Configuration dataclass"""

    enable_diagnostics: bool = True
    use_lsp: bool = True
    colors: Optional[Dict[str, str]] = None

    def __post_init__(self):
        if self.colors is None:
            self.colors = {
                "background": "#151144",
                "foreground": "#00ff92",
            }


class DataProcessor:
    """Process data with various transformations"""

    def __init__(self, name: str, threshold: int = 0):
        self.name = name
        self.threshold = threshold
        self._cache: Dict[str, Any] = {}

    def process(self, data: List[Dict]) -> Tuple[List[Dict], Optional[str]]:
        """
        Process input data and return results

        Args:
            data: List of dictionaries to process

        Returns:
            Tuple of (processed data, error message)
        """
        if not isinstance(data, list):
            return [], "Input must be a list"

        result = []

        for i, item in enumerate(data):
            # Filter and transform
            if item.get("active") and item.get("value", 0) > self.threshold:
                result.append(
                    {
                        "id": item.get("id", i),
                        "value": item["value"] * 2,
                        "timestamp": datetime.now().isoformat(),
                    }
                )

        return result, None

    @staticmethod
    def validate(data: Dict) -> bool:
        """Validate data structure"""
        required_fields = ["id", "value", "active"]
        return all((field in data) for field in required_fields)

    @property
    def cache_size(self) -> int:
        """Get current cache size"""
        return len(self._cache)


def fetch_data(url: str, timeout: float = DEFAULT_TIMEOUT) -> Dict:
    """
    Fetch data from URL

    Args:
        url: The URL to fetch
        timeout: Request timeout in seconds

    Returns:
        Response data dictionary
    """
    # TODO: Implement actual HTTP request
    return {
        "status": "success",
        "code": 200,
        "body": "Hello, cyberpunk world!",
    }


def check_status(code: int) -> str:
    """Check HTTP status code"""
    if code == 200:
        return "OK"
    elif 400 <= code < 500:
        return "Client Error"
    elif code >= 500:
        return "Server Error"
    else:
        return "Unknown"


# String examples
messages = {
    "greeting": "Hello, world!",
    "error": "Something went wrong",
    "template": f"""
        Version: {VERSION}
        Retries: {MAX_RETRIES}
        Timeout: {DEFAULT_TIMEOUT}s
    """,
}

# List comprehension
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
even_numbers = [n for n in numbers if n % 2 == 0]
squared = [n**2 for n in numbers]

# Dictionary comprehension
word_lengths = {word: len(word) for word in ["hello", "world", "python"]}

# Lambda functions
multiply = lambda x, y: x * y
is_even = lambda n: n % 2 == 0

# Conditional logic
for num in range(1, 11):
    if num % 2 == 0:
        print(f"Even: {num}")
    else:
        print(f"Odd: {num}")

# Exception handling
try:
    processor = DataProcessor("main", threshold=5)
    result, error = processor.process(
        [
            {"id": 1, "active": True, "value": 10},
            {"id": 2, "active": False, "value": 20},
        ]
    )

    if error:
        raise ValueError(error)

    print(f"Processed {len(result)} items")

except ValueError as e:
    print(f"Validation error: {e}")
except Exception as e:
    print(f"Unexpected error: {e}")
finally:
    print("Cleanup completed")

# Context manager
with open("example.txt", "w") as f:
    f.write("Hello, cyberneon!")


# Decorators
def timing_decorator(func):
    """Measure function execution time"""

    def wrapper(*args, **kwargs):
        start = datetime.now()
        result = func(*args, **kwargs)
        end = datetime.now()
        print(f"{func.__name__} took {(end - start).total_seconds()}s")
        return result

    return wrapper


@timing_decorator
def slow_function(n: int) -> int:
    """A slow function for demonstration"""
    total = 0
    for i in range(n):
        total += i
    return total


if __name__ == "__main__":
    print(f"cyberneon.nvim demo v{VERSION}")
    result = slow_function(1000000)
    print(f"Result: {result}")
