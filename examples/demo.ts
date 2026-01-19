/**
 * cyberneon.nvim theme demo
 * TypeScript syntax highlighting example
 */

// Imports
import { useState, useEffect, useCallback } from 'react';
import type { FC, ReactNode } from 'react';

// Constants
const VERSION = '1.0.0';
const MAX_RETRIES = 3;
const DEFAULT_TIMEOUT = 5000;

// Type definitions
interface Config {
  enableDiagnostics: boolean;
  useLSP: boolean;
  colors: {
    background: string;
    foreground: string;
  };
}

interface DataItem {
  id: number;
  active: boolean;
  value: number;
  timestamp?: string;
}

type ProcessResult<T> = {
  data: T[];
  error: string | null;
};

// Enums
enum StatusCode {
  OK = 200,
  BadRequest = 400,
  NotFound = 404,
  ServerError = 500,
}

enum LogLevel {
  Debug = 'debug',
  Info = 'info',
  Warning = 'warning',
  Error = 'error',
}

// Generic class
class DataProcessor<T extends DataItem> {
  private cache: Map<string, T> = new Map();
  
  constructor(
    public name: string,
    private threshold: number = 0
  ) {}
  
  /**
   * Process input data
   * @param data Array of items to process
   * @returns Processed result with optional error
   */
  process(data: T[]): ProcessResult<T> {
    if (!Array.isArray(data)) {
      return { data: [], error: 'Input must be an array' };
    }
    
    const result: T[] = data
      .filter(item => item.active && item.value > this.threshold)
      .map((item, index) => ({
        ...item,
        id: item.id ?? index,
        value: item.value * 2,
        timestamp: new Date().toISOString(),
      }));
    
    return { data: result, error: null };
  }
  
  get cacheSize(): number {
    return this.cache.size;
  }
  
  static validate(data: unknown): data is DataItem {
    return (
      typeof data === 'object' &&
      data !== null &&
      'id' in data &&
      'active' in data &&
      'value' in data
    );
  }
}

// Async function
async function fetchData(url: string, timeout = DEFAULT_TIMEOUT): Promise<Response> {
  // TODO: Implement actual HTTP request
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve({
        status: 'success',
        code: StatusCode.OK,
        body: 'Hello, cyberpunk world!',
      } as any);
    }, timeout);
  });
}

// Arrow functions
const checkStatus = (code: number): string => {
  if (code === StatusCode.OK) return 'OK';
  if (code >= 400 && code < 500) return 'Client Error';
  if (code >= 500) return 'Server Error';
  return 'Unknown';
};

const multiply = (x: number, y: number): number => x * y;
const isEven = (n: number): boolean => n % 2 === 0;

// React component
interface ButtonProps {
  onClick: () => void;
  children: ReactNode;
  disabled?: boolean;
  variant?: 'primary' | 'secondary';
}

const Button: FC<ButtonProps> = ({ 
  onClick, 
  children, 
  disabled = false,
  variant = 'primary'
}) => {
  const [isLoading, setIsLoading] = useState(false);
  
  useEffect(() => {
    console.log(`Button mounted with variant: ${variant}`);
    
    return () => {
      console.log('Button unmounted');
    };
  }, [variant]);
  
  const handleClick = useCallback(async () => {
    setIsLoading(true);
    try {
      await onClick();
    } catch (error) {
      console.error('Button click failed:', error);
    } finally {
      setIsLoading(false);
    }
  }, [onClick]);
  
  return (
    <button
      onClick={handleClick}
      disabled={disabled || isLoading}
      className={`btn btn-${variant}`}
    >
      {isLoading ? 'Loading...' : children}
    </button>
  );
};

// String templates
const messages = {
  greeting: "Hello, world!",
  error: 'Something went wrong',
  template: `
    Version: ${VERSION}
    Retries: ${MAX_RETRIES}
    Timeout: ${DEFAULT_TIMEOUT}ms
  `,
};

// Array operations
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = numbers.filter(n => n % 2 === 0);
const squared = numbers.map(n => n ** 2);
const sum = numbers.reduce((acc, n) => acc + n, 0);

// Object destructuring
const config: Config = {
  enableDiagnostics: true,
  useLSP: true,
  colors: {
    background: '#151144',
    foreground: '#00ff92',
  },
};

const { enableDiagnostics, colors: { background, foreground } } = config;

// Loops
for (let i = 0; i < 10; i++) {
  if (i % 2 === 0) {
    console.log(`Even: ${i}`);
  } else {
    console.log(`Odd: ${i}`);
  }
}

// Try-catch
try {
  const processor = new DataProcessor<DataItem>('main', 5);
  const result = processor.process([
    { id: 1, active: true, value: 10 },
    { id: 2, active: false, value: 20 },
  ]);
  
  if (result.error) {
    throw new Error(result.error);
  }
  
  console.log(`Processed ${result.data.length} items`);
} catch (error) {
  if (error instanceof Error) {
    console.error('Processing failed:', error.message);
  }
}

// Export
export { Button, DataProcessor, fetchData, checkStatus };
export type { Config, DataItem, ProcessResult };
export default DataProcessor;
